import Ember from 'ember';

export default Ember.Controller.extend({
  adding: false,
  store: Ember.inject.service(),
  query: null,

  init() {
    this.get('store').findAll('department').then((departments) => {
      this.set('departments', departments);
    });
  },

  actions: {
    showAddNew() {
      this.set('newEmployee', this.get('store').createRecord('employee'));
      this.set('adding', true);
    },

    search() {
      this.send('refresh');
    },

    submit(employee) {
      employee.save().then(() => {
        this.send('refresh');
        this.set('adding', false);
      });
    },

    delete(employee) {
      employee.destroyRecord().then(() => {
        this.send('refresh');
      });
    }
  }
});
