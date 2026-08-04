<template>
    <fieldset>
        <span class="legend">Project Info</span>
        <div class="table-responsive">
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <th style="width:30%">Project</th>
                        <th style="text-align: center; width: 2%;">:</th>
                        <td>{{ data.project?.title }}</td>
                    </tr>
                    <tr>
                        <th>Start Date</th>
                        <th>:</th>
                        <td>{{ data.project?.start_date }}</td>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <th>:</th>
                        <td><span v-html="data.project?.description"></span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </fieldset>
</template>

<script>
export default {
    props: { data: { type: Object, required: true } }
};
</script>
