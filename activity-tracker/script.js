const API_BASE = 'http://localhost:8080/api';

// Tab functionality
function showTab(tabName) {
    document.querySelectorAll('.tab-content').forEach(tab => tab.classList.remove('active'));
    document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
    
    document.getElementById(tabName).classList.add('active');
    event.target.classList.add('active');
    
    if (tabName === 'activities') {
        loadActivities();
    } else if (tabName === 'feedback') {
        loadFeedback();
    }
}

// Activity Management
document.getElementById('activityForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const activity = {
        title: document.getElementById('activityTitle').value,
        description: document.getElementById('activityDescription').value,
        status: document.getElementById('activityStatus').value
    };
    
    try {
        await fetch(`${API_BASE}/activities`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(activity)
        });
        
        document.getElementById('activityForm').reset();
        loadActivities();
    } catch (error) {
        console.error('Error creating activity:', error);
    }
});

async function loadActivities() {
    try {
        const response = await fetch(`${API_BASE}/activities`);
        const activities = await response.json();
        
        const container = document.getElementById('activitiesList');
        container.innerHTML = activities.map(activity => `
            <div class="item">
                <div class="item-header">
                    <span class="item-title">${activity.title}</span>
                    <div>
                        <span class="status ${activity.status}">${activity.status.replace('-', ' ').toUpperCase()}</span>
                        <button class="delete-btn" onclick="deleteActivity(${activity.id})">Delete</button>
                    </div>
                </div>
                <p>${activity.description || 'No description'}</p>
                <div class="item-meta">
                    Created: ${new Date(activity.createdAt).toLocaleString()}
                    ${activity.updatedAt !== activity.createdAt ? 
                        `| Updated: ${new Date(activity.updatedAt).toLocaleString()}` : ''}
                </div>
            </div>
        `).join('');
    } catch (error) {
        console.error('Error loading activities:', error);
    }
}

async function deleteActivity(id) {
    if (confirm('Are you sure you want to delete this activity?')) {
        try {
            await fetch(`${API_BASE}/activities/${id}`, { method: 'DELETE' });
            loadActivities();
        } catch (error) {
            console.error('Error deleting activity:', error);
        }
    }
}

// Feedback Management
document.getElementById('feedbackForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const feedback = {
        category: document.getElementById('feedbackCategory').value,
        content: document.getElementById('feedbackContent').value,
        severity: document.getElementById('feedbackSeverity').value
    };
    
    try {
        await fetch(`${API_BASE}/feedback`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(feedback)
        });
        
        document.getElementById('feedbackForm').reset();
        loadFeedback();
    } catch (error) {
        console.error('Error creating feedback:', error);
    }
});

async function loadFeedback() {
    try {
        const response = await fetch(`${API_BASE}/feedback`);
        const feedback = await response.json();
        
        const container = document.getElementById('feedbackList');
        container.innerHTML = feedback.map(item => `
            <div class="item">
                <div class="item-header">
                    <span class="item-title">${item.category.toUpperCase()}</span>
                    <div>
                        <span class="severity ${item.severity}">${item.severity.toUpperCase()}</span>
                        <button class="delete-btn" onclick="deleteFeedback(${item.id})">Delete</button>
                    </div>
                </div>
                <p>${item.content}</p>
                <div class="item-meta">
                    Created: ${new Date(item.createdAt).toLocaleString()}
                </div>
            </div>
        `).join('');
    } catch (error) {
        console.error('Error loading feedback:', error);
    }
}

async function deleteFeedback(id) {
    if (confirm('Are you sure you want to delete this feedback?')) {
        try {
            await fetch(`${API_BASE}/feedback/${id}`, { method: 'DELETE' });
            loadFeedback();
        } catch (error) {
            console.error('Error deleting feedback:', error);
        }
    }
}

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    loadActivities();
});