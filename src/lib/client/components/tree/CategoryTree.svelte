<script lang="ts">
	import { TreeViewItem } from "@skeletonlabs/skeleton";
  import BaseTree from "./BaseTree.svelte";

  export let categories: any
</script>

<BaseTree>
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
</BaseTree>