using UnityEngine;
using System.Collections;

public class SceneControllerBase : MonoBehaviour {
	[SerializeField]
	UIProgressBar progressBar = null;
	[SerializeField]
	UIProgressBar progressBarExp = null;

	// Use this for initialization
	public virtual void Start () {
		progressBar.Value = 0.5f;
		progressBarExp.Value = 0.3f;
	}
}
