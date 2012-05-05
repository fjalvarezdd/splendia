{include file=header.tpl title=$title}
<div class="content">
	<div class="leftNav">
		{include file=leftNav.tpl}
	</div>
	<div class="center">
		<h2>This is the list of hotels and rooms</h2>
		{foreach from=$rooms item=$room}
		<div class="room">
			<h3>{$room.title}</h3>
			<img src={$room.image}/>
			<div class="roomDescription">
				{$room.description}
			</div>
			<div class="roomFacilities">
				{$room.facilities}
			</div>
			<div class="bookRoom">
				<input type="submit" name="book_now" value="Book!!">
			</div>
		</div>
		{/foreach}
	</div>
	<div class="rightNav">
		{include file=rightNav.tpl}
	</div>
</div>
{include file=footer.tpl} 