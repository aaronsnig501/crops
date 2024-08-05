<script lang="ts">
	import { TabGroup, TabAnchor } from "@skeletonlabs/skeleton"
	import type { PageData } from "./$types"
	import { page } from "$app/stores"

	import CategoryTree from "$lib/client/components/tree/CategoryTree.svelte";
	import PageStructure from "$lib/client/components/page/PageStructure.svelte";
	import TreeAndTabStructure from "$lib/client/components/page/TreeAndTabStructure.svelte";

	export let data: PageData

	$: ({ categories } = data)
</script>

<TreeAndTabStructure categories={categories}>
</TreeAndTabStructure>
