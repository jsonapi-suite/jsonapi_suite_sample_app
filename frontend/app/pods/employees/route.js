import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this._refresh();
  },

  _refresh() {
    let query = this.get('controller.query');

    return this.store.query('employee', {
      include: 'department',
      filter: { name_prefix: query }
    });
  },

  actions: {
    refresh() {
      this._refresh().then((employees) => {
        this.set('controller.model', employees);
      });
    }
  }
});
