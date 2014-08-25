<?php if(isset($this->_paginacion)):?>
<ul class="pagination">
	<?php if($this->_paginacion["primero"]):?>
		<li><a href="<?php echo $link . $this->_paginacion['primero'];?>">&laquo;&laquo;</a></li>
	<?php else:?>
		<li class="disabled"><a>&laquo;&laquo;</a></li>
	<?php endif;?>
	<?php if($this->_paginacion["anterior"]):?>
		<li><a href="<?php echo $link . $this->_paginacion['anterior'];?>">&laquo;</a></li>
	<?php else:?>
		<li class="disabled"><a>&laquo;</a></li>
	<?php endif;?>
	<?php for($i=0;$i<count($this->_paginacion["rango"]);$i++):?>

		<?php if($this->_paginacion["actual"]==$this->_paginacion["rango"][$i]):?>
			<li class="active"><a><?php echo $this->_paginacion["rango"][$i];?></a></li>
		<?php else:?>
			<li>
				<a href="<?php echo $link . $this->_paginacion["rango"][$i];?>">
					<?php echo $this->_paginacion["rango"][$i]?>
				</a>
			</li>
		<?php endif;?>
	<?php endfor;?>
	<?php if($this->_paginacion["siguiente"]):?>
		<li><a href="<?php echo $link . $this->_paginacion['siguiente'];?>">&raquo;</a></li>
	<?php else:?>
		<li class="disabled"><a>&raquo;</a></li>
	<?php endif;?>
	<?php if($this->_paginacion["ultimo"]):?>
		<li><a href="<?php echo $link . $this->_paginacion['ultimo'];?>">&raquo;&raquo;</a></li>
	<?php else:?>
		<li class="disabled"><a>&raquo;&raquo;</a></li>
	<?php endif;?>
</ul>
<?php endif;?>