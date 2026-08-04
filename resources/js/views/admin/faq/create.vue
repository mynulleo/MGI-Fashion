<template>
    <create-form @onSubmit="submit">
        <Input v-model="data.question" field="data.question" title="Question" :req="true" col="10" />
        <Input title="Sorting" field="data.sorting" v-model="data.sorting" :req="true" col="2" type="number" />
        <editor v-model="data.answer" title="Answer" col="12" />
        <Switch v-model="data.status" on-label="Active" off-label="Deactive" :req="true"></Switch>
    </create-form>

</template>

<script>
const model = "faq";
import Editor from "../../../components/Form/CKEditor";

export default {
    components: { Editor },
    data() {
        return {
            page_title: "",
            model: model,
            data: { status: "active" },
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
                        "You need to fill " + error + " more empty mandatory fields",
                        "warning"
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
            this.page_title = "Faq Edit";
            this.get_data(`${this.model}/${this.$route.params.id}`);
        } else {
            this.page_title = "Faq Create";
            this.get_sorting("Faq");
        }
    },

    validators: {
        "data.question": function (value = null) {
            return Validator.value(value).required("Question is required");
        },
        "data.status": function (value = null) {
            return Validator.value(value).required("Status is required");
        },
    },
};
</script>
