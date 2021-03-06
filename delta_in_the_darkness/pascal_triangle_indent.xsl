<transform version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform">

<output method="text"/>

<template match="/" name="l">
  <param name="s" select="1"/>

<variable name="v" select="tokenize(concat('0 ',$s,' 0'),'\s+')"/>

<if test="$v[3]!=20">

  <value-of select="$s"/><text>
</text>

  <call-template name="l">
    <with-param name="s">
      <for-each select="$v[1],$v[.!=0]">
        <variable name="p" select="position()"/>
        <value-of select="concat(.+$v[$p+1],' ')"/>
      </for-each>
    </with-param>
  </call-template>

</if>

</template>

</transform>
