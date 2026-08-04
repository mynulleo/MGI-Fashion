<template>
  <create-form @onSubmit="submit">
    <div class="row align-items-center">
      <Input v-model="data.name" field="data.name" title="Name" :req="false" />
      <Input v-model="data.email" field="data.email" title="Email" :req="false" />
      <Input v-model="data.subject" field="data.subject" title="Subject" :req="false" />
      <div class="col-12 mb-3">
        <label class="form-label">Message</label>
        <div class="col-12">
          <editor v-model="data.message" />
        </div>
      </div>
      <input type="file" name="image" @change="testcrop">
      <!-- <input type="file" name="image" @change="testcrop"> -->

      <CropTest :image="img" 
        :aspectRatio="{ aspectRatio: 600 / 600 }"
       :width="200" :height="200" field="data.image" />
      <!-- <CropTest :image="img1" field="data.image1" /> -->

    </div>
    <Button title="Submit" process="" />
  </create-form>
</template>

<script>
import Editor from "../../../components/Form/CKEditor";
import CropTest from "./../../../components/elements/CropTest.vue";
const model = "contacts";

export default {
  components: { Editor, CropTest },
  data() {
    return {
      model: model,
      data: {},
      img: 'https://images.pexels.com/photos/4323307/pexels-photo-4323307.jpeg',
      img1: 'https://images.pexels.com/photos/4323307/pexels-photo-4323307.jpeg',

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
          var form = document.getElementById("form");
          var formData = new FormData(form);
          formData.append("message", this.data.message);
          if (this.data.id) {
            this.update(this.model, formData, this.data.id);
          } else {
            this.store(this.model, formData);
          }
        }
      });
    },
    testcrop() {
      $("#testcrop").modal("show");
    },
  },
  created() {
    if (this.$route.params.id) {
      this.setBreadcrumbs(this.model, "edit");
      this.get_data(`${this.model}/${this.$route.params.id}`);
    } else {
      this.setBreadcrumbs(this.model, "create");
    }
  },

  // validation rule for form
  validators: {},
};
</script>
