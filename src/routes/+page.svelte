<script lang="ts">
	import type { PageData } from "./$types"

	import PageStructure from "$lib/client/components/page/PageStructure.svelte";
	import { TabGroup, Tab, TreeView, TreeViewItem } from "@skeletonlabs/skeleton";

	export let data: PageData

	$: ({ categories } = data)

	let tabSet: number = 0
</script>

<PageStructure>
  <div slot="aside">
		<TreeView>
			{#each categories as category}
				{#if category.crops.length >= 1}
					<TreeViewItem>
						{category.name}
						<svelte:fragment slot="children">
							{#each category.crops as crop}
								<TreeViewItem>
									{crop.name}
									<svelte:fragment slot="children">
										{#each crop.types as type}
											<TreeViewItem>
												{type.name}
											</TreeViewItem>
										{/each}
									</svelte:fragment>
								</TreeViewItem>
							{/each}
						</svelte:fragment>
					</TreeViewItem>
				{/if}
			{/each}
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
				Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt maiores vero neque in nisi debitis ratione illo officiis itaque, voluptatum voluptatibus aperiam error ut animi quas excepturi laudantium quasi aliquam.
			</svelte:fragment>
		</TabGroup>
	</div>
</PageStructure>
