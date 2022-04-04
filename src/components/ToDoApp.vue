<template>
  <div>
  <div class="container p-3 my-3 border bg-white border-dark rounded">
    <h2 class="text-center">ToDo App</h2>

      <h5 class="text-center mt-4" :style="`color: ${color}`">{{message}}</h5>


      <div class="d-flex flex-row-reverse">
        <div>
            <button @click="viewTaskBar" class="btn btn-danger rounded-0" :style="`display: ${disp2}`">+ Add Task</button>
        </div>
      </div>

      <div :style="`display: ${disp}`" class="d-flex justify-content-around my-2 bg-dark border border-dark rounded">

        <div class="p-1" :style="`display: ${disp}`">
          <input v-model="task" type="text" placeholder="Enter Task" class="form-control" v-on:keyup.enter="submitTask">
        </div>  
        
        <!-- <input type="checkbox" id="To-Do" value="To-Do" v-model="checkedNames">
        <label for="To-Do">To-Do</label>
        <input type="checkbox" id="On-Progress" value="On-Progress" v-model="checkedNames">
        <label for="">On Progress</label>
        <input type="checkbox" id="Completed" value="Completed" v-model="checkedNames">
        <label for="Completed">Completed</label> -->

        <div class="p-1" :style="`display: ${disp}`">
          <select class="form-control" v-model="status">
            <option disabled value="">Choose Task Status</option>
            <option value="To-Do">To-Do</option>
            <option value="On Progress">On Progress</option>
            <option value="Completed">Completed</option>
          </select>
        </div>  

        <div class="p-1" :style="`display: ${disp}`">
          <select class="form-control" v-model="priority">
              <option disabled value="">Choose Priority</option>
              <option value="Low">Low</option>
              <option value="Medium">Medium</option>
              <option value="High">High</option>
            </select>
        </div>

       <div class="p-1" :style="`display: ${disp}`">
          <datepicker v-model="date" format="dd-MM-yyyy" placeholder="Choose Deadline"></datepicker>
        </div>

        <div class="p-1" :style="`display: ${disp}`">
          <button @click="submitTask" class="btn btn-danger rounded-0">Submit</button>
        </div>

      </div>  
      <table id="my_table" class="table mt-5" style="text-align:center">
        <thead>
          <tr>
            <th scope="col">No</th>
            <th scope="col">Task</th>
            <th scope="col">Status</th>
            <th scope="col">Priority</th>
            <th scope="col">Deadline</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(task,index) in tasks" :key="index">
            <th scope="row">{{ index+1 }}</th>
            <td>{{ task.name }}</td>
            <td>{{ task.status }}</td>
            <td>{{ task.priority }}</td>
            <td>{{ task.date | formatDate }}</td>
            <td>
              <div class="text-center">
                <button class="btn btn-primary rounded-1" @click="edit(index)" >Edit</button>
              &nbsp;
                <button class="btn btn-warning rounded-1" @click="deleteTask(index)">Delete</button>
              </div>
            </td>
          </tr>
        </tbody>
    </table>
    <h4 class="text-center" v-show="tasks.length == 0">No Pending Tasks</h4>

    <div></div>

  </div>
  </div>
</template>

<script>
import Datepicker from 'vuejs-datepicker';
import moment from 'moment';
export default {
  components: { Datepicker },
  name: 'ToDoApp',
  props: {
    msg: String
  },

  data() {
    return {
      task: "",
      status: "",
      priority: "",
      message: "",
      color: "",
      editTask: null,
      disp: 'none',
      disp2: '',
      date: '',
      tasks: []
    }
  },

  methods: {
    submitTask() {
      /* date1 = moment(this.date).format("dd-mm-yyyy")
      date2 = moment(currentDate).format("dd-mm-yyyy") */

      if(this.task.length === 0 || this.status.length === 0 || this.priority.length === 0 || this.date.length === 0)
      {
        this.message = "Fill all required fields",
        this.color = 'red',

        setTimeout(() => {
           this.message = ''
        }, 4000);
      }
      else if(moment(this.date).isBefore(moment(new Date())))
      {
        this.message = 'Deadline should be after the current date',
        this.color = 'red',

        setTimeout(() => {
           this.message = ''
        }, 4000)
      }
      else if(this.editTask === null)
      {
        this.tasks.push({
        name: this.task,
        status: this.status,
        priority: this.priority,
        date: this.date
        }),

        this.task = '',
        this.priority = '',
        this.status = '',
        this.date = '',
              
        this.color = 'green',

        this.disp = 'none',
        this.disp2 = '',
        this.message = 'Task Added Successfully',

        setTimeout(() => {
           this.message = ''
        }, 4000);

      }
      else
      {
        this.tasks[this.editTask].name = this.task;
        this.tasks[this.editTask].status = this.status;
        this.tasks[this.editTask].priority = this.priority;
        this.tasks[this.editTask].date = this.date;

        this.task = '',
        this.priority = '',
        this.status = '',
        this.date = '',
        this.editTask = null,

        this.message = 'Task Edited Successfully',
        this.color = 'green'

        this.disp = 'none',
        this.disp2 = '',

        setTimeout(() => {
           this.message = ''
        }, 4000);
      
      }
    },

    deleteTask(index) {
      this.tasks.splice(index, 1),

      this.message = 'Task Deleted Successfully',
      this.color = 'green',

      this.disp = 'none',
      this.disp2 = '',

      setTimeout(() => {
          this.message = ''
      }, 4000);
      
    },

    edit(index) {
      this.disp = '',
      this.disp2 = 'none',
      this.task = this.tasks[index].name,
      this.status = this.tasks[index].status,
      this.priority = this.tasks[index].priority,
      this.date = this.tasks[index].date,
      this.editTask = index,
      this.submitTask
    },

    viewTaskBar() {
      this.disp = '',
      this.disp2 = 'none'
    }
  },

  filters: {   
    formatDate: function (value) 
    {     
      if (!value) return ''         
      //return moment(String(value.toString() )).format('DD-MM-YYYY')
      if(moment(String(value.toString())).isSameOrAfter(moment(new Date())))
      {
        return moment(String(value.toString() )).format('DD-MM-YYYY')
      }
      else
      {
        return moment(String(value.toString() )).format('DD-MM-YYYY')+' [OVERDUE]'
      }
    } 
}
}
</script>

<style scoped>

</style>
