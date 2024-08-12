<script lang="ts">
  import { page } from '$app/stores';
	import PageStructure from "$lib/client/components/page/PageStructure.svelte"

  let [ currentLevel, idOfPreviousLevel ] = $page.params.path.split("/")
</script>

<PageStructure>
  <div slot="content" class="w-3/4">
    <h2 class="text-2xl">Create new {currentLevel}</h2>
    <form method="POST" action="?/createNewEntry">
      <input type="hidden" name="level" bind:value={currentLevel} />
      <input type="hidden" name="idOfPreviousLevel" bind:value={idOfPreviousLevel} />

      <label class="label mt-4">
        <span>Name:</span>
        <input required class="input" name="name" id="name" />
      </label>
      
      <label class="label mt-4">
        <span>Description:</span>
        <textarea required name="description" class="textarea"></textarea>
      </label>

      <label class="label mt-4">
        <span>Growing:</span>
        <textarea name="grow" class="textarea"></textarea>
      </label>

      <label class="label mt-4">
        <span>Storing:</span>
        <textarea name="store"class="textarea"></textarea>
      </label>

      <label class="label mt-4">
        <span>Cooking:</span>
        <textarea name="cook" class="textarea"></textarea>
      </label>
      <label class="label mt-4">
        <span>Preserving:</span>
        <textarea name="preserve" class="textarea"></textarea>
      </label>

      <button class="btn bg-gradient-to-br variant-gradient-primary-secondary mt-4">Submit</button>
    </form>
  </div>
</PageStructure>
