<?php if(isset($this->_paginacion)):?>
<ul class="pagination">
	<?php if($this->_paginacion["primero"]):?>
		<li><a class="pagina" pagina="<?php echo $this->_paginacion['primero'];?>" href="javascript:void(0)">&laquo;&laquo;</a></li>
	<?php else:?>
		<li class="disabled"><a>&laquo;&laquo;</a></li>
	<?php endif;?>
	<?php if($this->_paginacion["anterior"]):?>
		<li><a class="pagina" pagina="<?php echo $this->_paginacion["anterior"];?>" href="javascript:void(0)">&laquo;</a></li>
	<?php else:?>
		<li class="disabled"><a>&laquo;</a></li>
	<?php endif;?>
	<?php for($i=0;$i<count($this->_paginacion["rango"]);$i++):?>

		<?php if($this->_paginacion["actual"]==$this->_paginacion["rango"][$i]):?>
			<li class="active"><a><?php echo $this->_paginacion["rango"][$i];?></a></li>
		<?php else:?>
			<li>
				<a class="pagina" pagina="<?php echo $this->_paginacion["rango"][$i];?>" href="javascript:void(0)">
					<?php echo $this->_paginacion["rango"][$i]?>
				</a>
			</li>
		<?php endif;?>
	<?php endfor;?>
	<?php if($this->_paginacion["siguiente"]):?>
		<li><a class="pagina" pagina="<?php echo $this->_paginacion["siguiente"];?>" href="javascript:void(0)">&raquo;</a></li>
	<?php else:?>
		<li class="disabled"><a>&raquo;</a></li>
	<?php endif;?>
	<?php if($this->_paginacion["ultimo"]):?>
		<li><a class="pagina" pagina="<?php echo $this->_paginacion["ultimo"];?>" href="javascript:void(0)">&raquo;&raquo;</a></li>
	<?php else:?>
		<li class="disabled"><a>&raquo;&raquo;</a></li>
	<?php endif;?>
</ul>
<?php endif;?>