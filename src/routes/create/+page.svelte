<script lang="ts">
	import PageStructure from "$lib/client/components/page/PageStructure.svelte"

  const postData = {
    level: "",
    name: "",
    description: "",
    growing: "",
    storing: "",
    preserving: "",
    cooking: ""
  }

  const handleCreateFormSubmission = async() => {
    await fetch(
      "/create", { 
        method: "POST", 
        body: JSON.stringify({ postData }), 
        headers: { "Content-Type": "application/json"}
      }
    )
  }
</script>

<PageStructure>
  <div slot="content" class="w-3/4">
    <form on:submit|preventDefault={handleCreateFormSubmission}>
      <label class="label">
        <span>Level:</span>
        <select class="select" bind:value={postData.level}>
          <option value="category" selected>Category</option>
          <option value="crop">Crop</option>
          <option value="type">Type</option>
        </select>
      </label>

      <label class="label mt-4">
        <span>Name:</span>
        <input class="input" bind:value={postData.name} name="name" id="name" />
      </label>
      
      <label class="label mt-4">
        <span>Description:</span>
        <textarea class="textarea" bind:value={postData.description}></textarea>
      </label>

      <label class="label mt-4">
        <span>Growing:</span>
        <textarea class="textarea" bind:value={postData.growing}></textarea>
      </label>

      <label class="label mt-4">
        <span>Storing:</span>
        <textarea class="textarea" bind:value={postData.storing}></textarea>
      </label>

      <label class="label mt-4">
        <span>Cooking:</span>
        <textarea class="textarea" bind:value={postData.cooking}></textarea>
      </label>
      <label class="label mt-4">
        <span>Preserving:</span>
        <textarea class="textarea" bind:value={postData.preserving}></textarea>
      </label>

      <button class="btn bg-gradient-to-br variant-gradient-primary-secondary mt-4">Submit</button>
    </form>
  </div>
</PageStructure>
