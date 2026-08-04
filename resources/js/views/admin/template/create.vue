<template>
  <create-form @onSubmit='submit'>
    <Select title='Type' v-model='data.type' field='data.type' label='name' :reduce='(obj) => obj.value'
      :options='$root.global.template_types' placeholder='--Select One--' :closeOnSelect='true' :required='true'
      col="3" />
    <Input v-model='data.title' field='data.title' title='Title' :req='false' col="9" />
    <Input v-model='data.subject' field='data.subject' title='Subject' :req='false' col="12" />
    <div class='col-12 mb-3'>
      <label class='form-label'>Message</label>
      <div class='col-12'>
        <editor v-model='data.message' field='data.message' :required='false' col="12" />
      </div>
    </div>
    <Switch v-model='data.status' field='data.status' title='status' on-label='Active' off-label='Deactive' :req='true'>
    </Switch>

  </create-form>
</template>

<script>
import Editor from '../../../components/Form/CKEditor';

const model = 'template';

export default {
  components: { Editor },
  data() {
    return {
      model: model,
      page_title: '',
      data: {},

    };
  },

  provide() {
    return {
      validate: this.validation,

    };
  },
  methods: {
    submit: function (e) {
      this.$validate().then((res) => {
        const error = this.validation.countErrors();

        if (error > 0) {
          console.log(this.validation.allErrors());
          this.$toast(
            'You need to fill ' + error + ' more empty mandatory fields',
            'warning'
          );
          return false;
        }

        if (res) {
          var form = document.getElementById('form');
          var formData = new FormData(form);
          formData.append('message', this.data.message);
          formData.append('type', this.data.type);
          formData.append('status', this.data.status);
          if (this.data.id) {
            this.update(this.model, formData, this.data.id, true);
          } else {
            this.store(this.model, formData);
          }
        }
      });
    },
  },
  created() {
    if (this.$route.params.id) {
      this.page_title = this.headline(this.model) + ' Edit';
      this.get_data(`${this.model}/${this.$route.params.id}`);
    } else {
      this.page_title = this.headline(this.model) + ' Create';
    }
  },

  validators: {
    'data.type': function (value = null) { return Validator.value(value).required('Type is required'); },

  },
}

</script>