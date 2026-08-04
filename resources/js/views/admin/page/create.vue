<template>
    <create-form @onSubmit='submit'>
        <div class='col-12'>
            <Input v-model='data.title' field='data.title' title='Title' :req='false' />
        </div>
        <div class='col-12 mt-2'>
            <Switch v-model='data.status' field='data.status' title='Status' on-label='Active' off-label='Deactive'
                :req='true'></Switch>
        </div>
    </create-form>

</template>

<script>


const model = 'page';

export default {

    data() {
        return {
            page_title: "",
            model: model,
            data: {
                status: 'active',
            },

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
            this.page_title = "Page Edit";
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            // this.setBreadcrumbs(this.model, 'create');
            this.page_title = "Page Create";

        }
    },

    validators: {

    },
}

</script>
