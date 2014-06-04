using UnityEngine;
using System.Collections;

public class SceneControllerMain : SceneControllerBase
{
	[SerializeField]
	UIScrollList scrollList = null;
	[SerializeField]
	GameObject listItemPrefab = null;

	// Use this for initialization
	public override void Start () {
		base.Start();
		if(Application.loadedLevel == 0)
		{
			for(var i = 0; i < 10; i++) {
				var newItem = scrollList.CreateItem(listItemPrefab);
				scrollList.AddItem(newItem);
			}
			scrollList. PositionItems();
			scrollList.snap = true;
			scrollList.SetInputDelegate(OnNextButtonPress);
		}
	}

	private void OnNextButtonPress(ref POINTER_INFO ptr)
	{
		if (ptr.evt == POINTER_INFO.INPUT_EVENT.TAP)
		{
			Application.LoadLevel("Dangeon1");
		}
	}
}
