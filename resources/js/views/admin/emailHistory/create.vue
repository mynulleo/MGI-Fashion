<template>
  <create-form @onSubmit='submit'>
    <Select title='Template Id' v-model='data.template_id' field='data.template_id' label='name' :reduce='(obj) => obj.id' :options='[]' placeholder='--Select One--' :closeOnSelect='true' :required='false' /> 
				<Input v-model='data.subject' field='data.subject' title='Subject' :req='false' />
				<Input v-model='data.message' field='data.message' title='Message' :req='false' />
				<Input v-model='data.emails' field='data.emails' title='Emails' :req='false' />
<Switch
                v-model='data.status'
                field='data.status'
                title='status'
                on-label='Active'
                off-label='Deactive'
                :req='true'
            ></Switch>

  </create-form>
</template>

<script>


const model = 'emailHistory';

export default {
  
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
          
          
          if (this.data.id) {
            this.update(this.model, this.data, this.data.id);
          } else {
            this.store(this.model, this.data);
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
    						
  },
}

</script>