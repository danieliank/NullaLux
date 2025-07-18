//
//  MazeViewModel.swift
//  LightsOut
//
//  Created by Daniel Ian on 21/02/25.
//

import SwiftUI

class MazeViewModel: ObservableObject {
    @Published var grid: [[Bool]]
    @Published var width: Int
    @Published var height: Int
    @Published var player: Point
    var finish: Point
    @Published var itemLocation: Point
    @Published var itemCollected: Bool
    @Published var shakeTrigger: CGFloat = 0
    @Published var playerDirection: Direction = .right
    @Published var navigateToEnd = false
    @Published var horizontalSizeClass: UserInterfaceSizeClass?
    @Published var score: Int = 0
    @Published var resetCountdown: Bool = false  // Triggers timer reset
    
    init(width: Int, height: Int, sizeClass: UserInterfaceSizeClass? = nil) {
        self.width = width
        self.height = height
        self.horizontalSizeClass = sizeClass
        self.grid = Array(repeating: Array(repeating: false, count: height), count: width)
        self.player = Point(x: 1, y: 1)
        self.finish = Point(x: width - 2, y: height - 2)
        self.itemLocation = Point(x: 1, y: 1)
        self.itemCollected = false
    }

    func updateSizeClass(_ sizeClass: UserInterfaceSizeClass?) {
        self.horizontalSizeClass = sizeClass
    }
    
    func playerReachedExit() {
        score += 1
        navigateToEnd = true
        resetCountdown = true
    }
    
    func generateMaze() {
        itemCollected = false
        navigateToEnd = false
        grid = Array(repeating: Array(repeating: false, count: height), count: width)
        finish = Point(x: width - 2, y: height - 2)

        for x in 0..<width {
            grid[x][0] = false
            grid[x][height - 1] = false
        }
        for y in 0..<height {
            grid[0][y] = false
            grid[width - 1][y] = false
        }
        
        var frontier: Set<Point> = []
        let start = Point(x: 1, y: 1)
        grid[start.x][start.y] = true
        frontier.formUnion(getFrontier(of: start))
        
        while !frontier.isEmpty {
            guard let point = frontier.randomElement() else { return }
            frontier.remove(point)
            
            if let neighbor = getNeighbours(of: point).randomElement() {
                connect(from: point, to: neighbor)
                grid[point.x][point.y] = true
            }
            
            frontier.formUnion(getFrontier(of: point))
        }
        
        var availableSpots = [(Int, Int)]()
        for x in 1..<width-1 {
            for y in 1..<height-1 {
                if grid[x][y] && Point(x: x, y: y) != Point(x: 1, y: 1) && Point(x: x, y: y) != finish {
                    availableSpots.append((x, y))
                }
            }
        }
        
        if let randomSpot = availableSpots.randomElement() {
            itemLocation = Point(x: randomSpot.0, y: randomSpot.1)
        }
        
        resetPlayerPosition()
    }
    
    func resetPlayerPosition() {
        player = Point(x: 1, y: 1)
    }
    
    private func getFrontier(of point: Point) -> Set<Point> {
        var f: Set<Point> = []
        if point.x > 1 && !grid[point.x - 2][point.y] { f.insert(Point(x: point.x - 2, y: point.y)) }
        if point.x + 2 < width - 1 && !grid[point.x + 2][point.y] { f.insert(Point(x: point.x + 2, y: point.y)) }
        if point.y > 1 && !grid[point.x][point.y - 2] { f.insert(Point(x: point.x, y: point.y - 2)) }
        if point.y + 2 < height - 1 && !grid[point.x][point.y + 2] { f.insert(Point(x: point.x, y: point.y + 2)) }
        return f
    }
    
    private func getNeighbours(of point: Point) -> [Point] {
        var n: [Point] = []
        if point.x > 1 && grid[point.x - 2][point.y] { n.append(Point(x: point.x - 2, y: point.y)) }
        if point.x + 2 < width - 1 && grid[point.x + 2][point.y] { n.append(Point(x: point.x + 2, y: point.y)) }
        if point.y > 1 && grid[point.x][point.y - 2] { n.append(Point(x: point.x, y: point.y - 2)) }
        if point.y + 2 < height - 1 && grid[point.x][point.y + 2] { n.append(Point(x: point.x, y: point.y + 2)) }
        return n
    }
    
    private func connect(from point1: Point, to point2: Point) {
        let midX = (point1.x + point2.x) / 2
        let midY = (point1.y + point2.y) / 2
        grid[point1.x][point1.y] = true
        grid[midX][midY] = true
    }
    
    @MainActor func movePlayer(direction: Direction) {
        let newPoint: Point
        switch direction {
        case .up:
            newPoint = Point(x: player.x, y: player.y - 1)
            playerDirection = .up
        case .down:
            newPoint = Point(x: player.x, y: player.y + 1)
            playerDirection = .down
        case .left:
            newPoint = Point(x: player.x - 1, y: player.y)
            playerDirection = .left
        case .right:
            newPoint = Point(x: player.x + 1, y: player.y)
            playerDirection = .right
        }

        if isValidMove(to: newPoint) {
            player = newPoint

            if !itemCollected && player == itemLocation {
                itemCollected = true
            }
        } else {
            withAnimation(.default) {
                shakeTrigger += 1
            }

            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }

        if player == finish && itemCollected {
            DispatchQueue.main.async {
                self.playerReachedExit()
            }
        }


    }


    
    private func isValidMove(to point: Point) -> Bool {
        return grid[point.x][point.y]
    }
    
    func getImageForCell(row: Int, col: Int) -> Image {
        if isWall(x: col, y: row) {
            return Image("Wall")
        } else {
            return Image("Background")
        }
    }


    func getViewForCell(row: Int, col: Int) -> some View {
        let isPhone = DeviceUtils.isPhone(sizeClass: horizontalSizeClass)
        let size: CGFloat = isPhone ? 30 : 60
        return ZStack {
            getImageForCell(row: row, col: col)
                .resizable()
                .frame(width: size, height: size)

            if Point(x: col, y: row) == finish {
                DoorView(isOpen: itemCollected)
            }

            if Point(x: col, y: row) == player {
                PlayerView(direction: playerDirection)
                    .scaleEffect(isPhone ? 0.75 : 1.5)
            }
        }
    }

    func getItem() -> some View {
        let isPhone = DeviceUtils.isPhone(sizeClass: horizontalSizeClass)
        return ItemView().scaleEffect(isPhone ? 1.0 : 2.0)    }

    func increaseMazeSize() {
        if width < 11 && height < 11 {
            width += 2
            height += 2
            generateMaze()
        }
    }

    func isWall(x: Int, y: Int) -> Bool {
        return isBorderWall(x: x, y: y) || !grid[x][y] && !itemCollected
    }
    
    private func isBorderWall(x: Int, y: Int) -> Bool {
        return x == 0 || x == width - 1 || y == 0 || y == height - 1
    }
}

#Preview {
    MazeView()
}
