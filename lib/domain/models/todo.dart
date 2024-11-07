/*

TO DO MODEL

--------------------------------------------
|               It has these properties    |
--------------------------------------------
| id: int                                |
| text: String                           |
| isCompleted: bool                      |

--------------------------------------------
|               It has these methods      |
--------------------------------------------
- toggle completion status
*/
class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo(
      {required this.id,
      required this.text,
      this.isCompleted = false // Todo is not completed by default
      });

  Todo toggleCompletion() {
    return Todo(id: id, text: text, isCompleted: !isCompleted);
  }
}
