<template>
  <div class="w-full h-full flex flex-col gap-2 items-center justify-center">
    <h1 class="text-3xl">Hello World!</h1>
    <CustomButton>
      <h1 class="text-red-500" @click="testClick">Click me!</h1>
    </CustomButton>
  </div>
</template>

<script setup lang="ts">
const testClick = () => {
  window.alert("wewaw");
};
</script>

<style scoped></style>
