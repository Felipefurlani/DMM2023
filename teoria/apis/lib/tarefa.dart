class tarefa{
   int _userId =0;
   int _taskId = 0;
   String _title ="";
   bool _completed = false;
  get userId => this._userId;

 set userId( value) => this._userId = value;

  get taskId => this._taskId;

 set taskId( value) => this._taskId = value;

  get title => this._title;

 set title( value) => this._title = value;

  get completed => this._completed;

 set completed( value) => this._completed = value;

tarefa();

tarefa.fromJson(Map<String, dynamic> json)
: _userId =json['userId'],
_taskId = json['id'],
_title = json ['title'],
_completed = json['completed']
;
}