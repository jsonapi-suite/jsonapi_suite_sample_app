import DS from 'ember-data';

export default DS.JSONAPIAdapter.extend(DS.EmbeddedRecordsMixin, {
  namespace: 'api'
});
