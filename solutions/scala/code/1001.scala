import java.util.Scanner

object Main {
    def main(args: Array[String]) {
        val reader = new Scanner(System.in)
        val first = reader.nextInt()
        val last = reader.nextInt()
        println("X = " + (first + last))
    }
}
