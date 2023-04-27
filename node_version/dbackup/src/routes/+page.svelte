<script>
	import { list_all_files } from '$lib';
</script>

{#await list_all_files() then files}
	{files}
{/await}
