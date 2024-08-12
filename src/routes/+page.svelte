<script lang="ts">
	import type { PageData } from "./$types"

	import PageStructure from "$lib/client/components/page/PageStructure.svelte";
	import { TabGroup, Tab, TreeView, TreeViewItem } from "@skeletonlabs/skeleton";

	export let data: PageData

	$: ({ categories } = data)

	let tabSet: number = 0

	$: selection = {}

	const filterSelection = async (
		categoryName: string, cropName?: string, typeName?: string
	) => {
		selection = categories.filter(category => category.name === categoryName)[0]

		if (cropName) {
			selection = selection.crops.filter(crop => crop.name === cropName)[0]

			if (typeName) {
				selection = selection.types.filter(type => type.name === typeName)[0]
			}
		}
	}
</script>

<PageStructure>
	
  <div slot="aside">
		<TreeView>
			{#each categories as category}
				{#if category.crops.length >= 1}
					<TreeViewItem on:click={filterSelection(category.name)}>
						{category.name} 
						<svelte:fragment slot="children">
							{#each category.crops as crop}
								<TreeViewItem on:click={filterSelection(category.name, crop.name)}>
									{crop.name}
									<svelte:fragment slot="children">
										{#each crop.types as type}
											<TreeViewItem on:click={filterSelection(category.name, crop.name, type.name)}>
												{type.name}
											</TreeViewItem>
										{/each}
										<TreeViewItem>
											<a href="/type/{crop.id}/create">Add new type</a>
										</TreeViewItem>
									</svelte:fragment>
								</TreeViewItem>
							{/each}
							<TreeViewItem>
								<a href="/crop/{category.id}/create">Add new crop</a>
							</TreeViewItem>
						</svelte:fragment>
					</TreeViewItem>
				{/if}
			{/each}
			<TreeViewItem>
				<a href="/category/create">Add new category</a>
			</TreeViewItem>
		</TreeView>
	</div>
	<div slot="content">
		<TabGroup justify="justify-center">
			<Tab bind:group={tabSet} name="tab1" value={0}>
				Description
			</Tab>
			<Tab bind:group={tabSet} name="tab2" value={1}>
				Growing
			</Tab>
			<Tab bind:group={tabSet} name="tab3" value={2}>
				Storing
			</Tab>
			<Tab bind:group={tabSet} name="tab4" value={3}>
				Cooking
			</Tab>
			<Tab bind:group={tabSet} name="tab5" value={4}>
				Preserving
			</Tab>
			<svelte:fragment slot="panel">
				{#if selection.description === undefined}
					<p>Select an item from the list</p>
				{:else}
					{#if tabSet == 0}
						{selection.description}
					{:else if tabSet === 1}
						{selection.grow}
					{:else if tabSet === 2}
						{selection.store}
					{:else if tabSet === 3}
						{selection.cook}
					{:else if tabSet === 4}
						{selection.preserve}
					{/if}
				{/if}
				
			</svelte:fragment>
		</TabGroup>
	</div>

	
</PageStructure>
