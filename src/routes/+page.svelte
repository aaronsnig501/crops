<script lang="ts">
	import { TreeView, TreeViewItem, TabGroup, Tab, TabAnchor } from "@skeletonlabs/skeleton"
	import type { PageData } from "./$types"

	export let data: PageData

	$: ({ categories } = data)

	let tabSet: number = 0;
</script>

<main class="col-span-6">
	<div class="bg-gradient-to-r from-green-400 via-green-300 to-green-200 w-screen">
		<header class="py-56">
			<h1 class="text-center text-5xl block">Crops
				<small class="text-center text-xl block pt-4">by Smart Garden</small>
			</h1>
		</header>
	</div>

</main>

<div class="container grid grid-cols-6 w-screen">
	<TreeView class="col-span-2 px-24 mt-24">
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

	<TabGroup justify="justify-center" class="col-span-4 mt-12">
		<Tab bind:group={tabSet} name="tab1" value={0}>
			Description
		</Tab>
		<Tab bind:group={tabSet} name="tab2" value={1}>
			Growing
		</Tab>
		<Tab bind:group={tabSet} name="tab3" value={2}>
			Cooking
		</Tab>
		<Tab bind:group={tabSet} name="tab4" value={3}>
			Perserving
		</Tab>
		<svelte:fragment slot="panel">
			{#if tabSet === 0}
				Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod nostrum accusantium repellendus at fuga provident voluptatem voluptas laboriosam laudantium eum, beatae nemo ullam neque error similique natus, id quasi soluta.
			{:else if tabSet === 1}
				Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ea esse, culpa possimus excepturi enim magnam ducimus minus, recusandae molestiae totam reiciendis labore cumque, deserunt suscipit dolore incidunt et distinctio temporibus!
			{:else if tabSet === 2}
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias animi unde provident natus in pariatur perferendis eum temporibus? Delectus consectetur aperiam reprehenderit quisquam harum nam dignissimos totam nostrum illum labore?
			{:else if tabSet === 3}
				Lorem, ipsum dolor sit amet consectetur adipisicing elit. Et reprehenderit necessitatibus iste laboriosam delectus earum maiores, officia sint. Optio expedita dolore incidunt ad dolorum nostrum ut ducimus inventore laborum nam.
			{/if}
		</svelte:fragment>
	</TabGroup>

</div>


