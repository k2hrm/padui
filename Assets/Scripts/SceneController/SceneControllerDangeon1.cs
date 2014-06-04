using UnityEngine;
using System.Collections;

public class SceneControllerDangeon1 : SceneControllerBase
{
	[SerializeField]
	UIButton backButton = null;

	// Use this for initialization
	public override void Start () {
		base.Start();
		backButton.SetInputDelegate(OnButtonPress);	
	}
	
	private void OnButtonPress(ref POINTER_INFO ptr)
	{
		if(ptr.evt == POINTER_INFO.INPUT_EVENT.PRESS && Application.loadedLevel == 1)
		{
			Application.LoadLevel("Main");
		}
	}
}
