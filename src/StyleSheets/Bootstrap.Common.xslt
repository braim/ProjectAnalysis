﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                >

  <xsl:variable name="cr" select="'&#xD;'"/>

  <xsl:key name="all-items-by-type" match="Item[@type]" use="@type"/>
  <xsl:key name="all-items-by-id" match="Item[@type]" use="@id"/>

  <xsl:template name="build-menu">
    <xsl:param name="tab"></xsl:param>
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Ampla</a>
          <div class="nav-collapse collapse">
            <!--            
  <p class="navbar-text pull-right">Logged in as <a href="#" class="navbar-link">Username</a></p>
-->
            <ul class="nav">
              <li >
                <a href="#">Home</a>
              </li>
              <li>
                <xsl:if test="$tab='Modules'">
                  <xsl:attribute name="class">active</xsl:attribute>
                </xsl:if>
                <a href="Bootstrap.Modules.html">Modules</a>
              </li>
              <li>
                <xsl:if test="$tab='Code Items'">
                  <xsl:attribute name="class">active</xsl:attribute>
                </xsl:if>
                <a href="Bootstrap.CodeItems.html">Code Items</a>
              </li>
              <li>
                <xsl:if test="$tab='Variables'">
                  <xsl:attribute name="class">active</xsl:attribute>
                </xsl:if>
                <a href="Bootstrap.Variables.html">Variables</a>
              </li>
              <li>
                <xsl:if test="$tab='Equipment Id'">
                  <xsl:attribute name="class">active</xsl:attribute>
                </xsl:if>
                <a href="Bootstrap.EquipmentIds.html">Equipment Ids</a>
              </li>
              <li>
                <xsl:if test="$tab='Metrics'">
                  <xsl:attribute name="class">active</xsl:attribute>
                </xsl:if>
                <a href="Project.Metrics.html">Metrics</a>
              </li>
              <li>
                <xsl:if test="$tab='Downtime Relationship'">
                  <xsl:attribute name="class">active</xsl:attribute>
                </xsl:if>
                <a href="Bootstrap.Downtime.html">Downtime Relationship</a>
              </li>
              <xsl:variable name='planning' select="key('all-items-by-type', 'Citect.Ampla.Planning.Server.PlanningReportingPoint')"/>
              <xsl:variable name='product-recipe' select="key('all-items-by-type', 'Citect.Ampla.Planning.Recipe.Server.ProductRecipe')"/>
              <xsl:variable name='machine-recipe' select="key('all-items-by-type', 'Citect.Ampla.Planning.Recipe.Server.MachineRecipe')"/>
              <xsl:variable name='schema' select="key('all-items-by-type', 'Citect.Ampla.Planning.Recipe.Server.RecipeSchema')"/>
              <xsl:if test="(count($planning) + count($product-recipe) + count($machine-recipe) + count($schema)) > 0">
                <li>
                  <xsl:if test="$tab='Planning'">
                    <xsl:attribute name="class">active</xsl:attribute>
                  </xsl:if>
                  <a href="Bootstrap.Planning.html">Planning</a>
                </li>
              </xsl:if>
              <li>
                <xsl:if test="$tab='Interfaces'">
                  <xsl:attribute name="class">active</xsl:attribute>
                </xsl:if>
                <a href="Project.Interfaces.html">Interfaces</a>
              </li>
              <li>
                <xsl:if test="$tab='Security'">
                  <xsl:attribute name="class">active</xsl:attribute>
                </xsl:if>
                <a href="Project.Security.html">Security</a>
              </li>
            </ul>
          </div>
          <!--/.nav-collapse -->
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="*" mode="badge">
    <!-- default badge template is none -->
  </xsl:template>

  <xsl:template match="*" mode="badge-position">
    <!-- default badge position is pull-right -->
    <xsl:text>pull-right</xsl:text>
  </xsl:template>

  <xsl:template name="color-badge">
    <xsl:param name="text">0</xsl:param>
    <xsl:param name="color">green</xsl:param>
    <xsl:call-template name="item-badge">
      <xsl:with-param name="color" select="$color"/>
      <xsl:with-param name="text" select="$text" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="color-label">
    <xsl:param name="text">0</xsl:param>
    <xsl:param name="color">green</xsl:param>
    <xsl:call-template name="item-label">
      <xsl:with-param name="color" select="$color"/>
      <xsl:with-param name="text" select="$text" />
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="item-badge">
    <xsl:param name="text">0</xsl:param>
    <xsl:param name="color">green</xsl:param>
    <xsl:variable name="badge-class">
      <xsl:choose>
        <xsl:when test="$color = 'grey'"></xsl:when>
        <xsl:when test="$color = 'gray'"></xsl:when>
        <xsl:when test="$color = 'green'">badge-success</xsl:when>
        <xsl:when test="$color = 'orange'">badge-warning</xsl:when>
        <xsl:when test="$color = 'red'">badge-important</xsl:when>
        <xsl:when test="$color = 'blue'">badge-info</xsl:when>
        <xsl:when test="$color = 'black'">badge-inverse</xsl:when>
        <xsl:otherwise>badge-success</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:element name="span">
      <xsl:attribute name="class">
        <xsl:text>badge </xsl:text>
        <xsl:value-of select="$badge-class"/>
      </xsl:attribute>
      <xsl:value-of select="$text"/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="item-label">
    <xsl:param name="text">0</xsl:param>
    <xsl:param name="color">green</xsl:param>
    <xsl:variable name="label-class">
      <xsl:choose>
        <xsl:when test="$color = 'grey'"></xsl:when>
        <xsl:when test="$color = 'gray'"></xsl:when>
        <xsl:when test="$color = 'green'">label-success</xsl:when>
        <xsl:when test="$color = 'orange'">label-warning</xsl:when>
        <xsl:when test="$color = 'red'">label-important</xsl:when>
        <xsl:when test="$color = 'blue'">label-info</xsl:when>
        <xsl:when test="$color = 'black'">label-inverse</xsl:when>
        <xsl:otherwise>label-success</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:element name="span">
      <xsl:attribute name="class">
        <xsl:text>label </xsl:text>
        <xsl:value-of select="$label-class"/>
      </xsl:attribute>
      <xsl:value-of select="$text"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="Item[@fullName]" mode="list-item">
    <i class="icon-plus"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="@fullName"/>
    <xsl:text> </xsl:text>

    <xsl:variable name="badge-position">
      <xsl:apply-templates select="." mode="badge-position"/>
    </xsl:variable>

    <xsl:variable name="badge">
      <xsl:apply-templates select="." mode="badge"/>
    </xsl:variable>

    <xsl:if test="string-length($badge > 0)">
      <span class="{$badge-position}">
        <xsl:apply-templates mode="badge" select="."/>
      </span>
    </xsl:if>
  </xsl:template>


  <xsl:template match="Item[@fullName]" mode="collapse-details">
    <xsl:param name="render-links">true</xsl:param>
    <xsl:variable name="properties" select="Property"/>
    <xsl:variable name="items" select="Item"/>
    <xsl:variable name="links" select="key('all-items-by-id', linkTo/link/@id)" />

    <xsl:if test="count($properties) > 0">
      <table class="table table-bordered table-hover">
        <tbody>
          <xsl:for-each select="$properties">
            <tr>
              <th>
                <xsl:value-of select="@name"/>
              </th>
              <td>
                <xsl:apply-templates select="." />
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <xsl:if test="$render-links = 'true'">
      <xsl:if test="count($links) > 0">
        <xsl:call-template name="list-links-with-details-collapsed">
          <xsl:with-param name="items" select="$links"/>
          <xsl:with-param name="prefix" select="concat(@hash, '_', position(), '_')"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
    <xsl:if test="count($items) > 0">
      <table>
        <tbody>
          <tr>
            <td>
              <xsl:call-template name="list-item-with-details-collapsed">
                <xsl:with-param name="items" select="$items"/>
              </xsl:call-template>
            </td>
          </tr>
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template name="list-item-with-details-collapsed">
    <xsl:param name="items"/>
    <xsl:param name="prefix"></xsl:param>

    <xsl:for-each select="$items">
      <xsl:sort select="@fullName"/>
      <xsl:variable name="div-id" select="concat($prefix, @hash, '_data')"/>
      <div id="{concat($prefix, @hash)}" data-toggle="collapse" data-target="{concat('#', $div-id)}">
        <xsl:apply-templates select="." mode="list-item"/>
      </div>
      <div id="{$div-id}" class="collapse">
        <xsl:apply-templates select="." mode="collapse-details">
          <xsl:with-param name="data-target" select="$div-id"/>
          <xsl:with-param name="render-links">true</xsl:with-param>
        </xsl:apply-templates>
      </div>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="Item[@fullName]" mode="list-link">
    <div class="well">
      <i class="icon-arrow-right"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="@fullName"/>
      <xsl:text> </xsl:text>

      <xsl:variable name="badge-position">
        <xsl:apply-templates select="." mode="badge-position"/>
      </xsl:variable>

      <xsl:variable name="badge">
        <xsl:apply-templates select="." mode="badge"/>
      </xsl:variable>

      <xsl:if test="string-length($badge > 0)">
        <span class="{$badge-position}">
          <xsl:apply-templates mode="badge" select="."/>
        </span>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="list-links-with-details-collapsed">
    <xsl:param name="items"/>
    <xsl:param name="prefix"></xsl:param>

    <xsl:for-each select="$items">
      <xsl:sort select="@fullName"/>
      <xsl:variable name="div-id" select="concat($prefix, @hash, '_data')"/>

      <div class="offset1">
        <div id="{concat($prefix, @hash)}" data-toggle="collapse" data-target="{concat('#', $div-id)}">
          <xsl:apply-templates select="." mode="list-link"/>
        </div>
        <div id="{$div-id}" class="collapse">
          <xsl:apply-templates select="." mode="collapse-details">
            <xsl:with-param name="data-target" select="$div-id"/>
            <xsl:with-param name="render-links">false</xsl:with-param>
          </xsl:apply-templates>
        </div>
      </div>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="count-lines">
    <xsl:param name="text" select="."/>
    <xsl:param name="counter">0</xsl:param>
    <xsl:choose>
      <xsl:when test="contains($text, $cr)">
        <xsl:call-template name="count-lines">
          <xsl:with-param name="text" select="substring-after($text, $cr)"/>
          <xsl:with-param name="counter" select="$counter + 1"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="string-length($text) > 0">
        <xsl:value-of select="$counter + 1"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$counter"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="space">
    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
