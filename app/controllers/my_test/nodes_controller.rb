class MyTest::NodesController < ApplicationController
  # GET /my_test/nodes
  # GET /my_test/nodes.json
  def index
    #@my_test_nodes = MyTest::Node.all
    # @my_test_nodes = MyTest::Node.first.to_node.to_json

    respond_to do |format|
      format.html # index.html.erb
      format.json# { render :json => @my_test_nodes }
    end
    #render :text => @my_test_node
  end

  # GET /my_test/nodes/1
  # GET /my_test/nodes/1.json
  def show
    #@my_test_node = MyTest::Node.find(params[:id])
    #@my_test_node = MyTest::Node.first.to_node

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @my_test_node }
    end
  end

  # GET /my_test/nodes/new
  # GET /my_test/nodes/new.json
  def new
    @my_test_node = MyTest::Node.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @my_test_node }
    end
  end

  # GET /my_test/nodes/1/edit
  def edit
    @my_test_node = MyTest::Node.find(params[:id])
  end

  # POST /my_test/nodes
  # POST /my_test/nodes.json
  def create
    @my_test_node = MyTest::Node.new(params[:my_test_node])

    respond_to do |format|
      if @my_test_node.save
        format.html { redirect_to @my_test_node, :notice => 'Node was successfully created.' }
        format.json { render :json => @my_test_node, :status => :created, :location => @my_test_node }
      else
        format.html { render :action => "new" }
        format.json { render :json => @my_test_node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /my_test/nodes/1
  # PUT /my_test/nodes/1.json
  def update
    @my_test_node = MyTest::Node.find(params[:id])

    respond_to do |format|
      if @my_test_node.update_attributes(params[:my_test_node])
        format.html { redirect_to @my_test_node, :notice => 'Node was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @my_test_node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /my_test/nodes/1
  # DELETE /my_test/nodes/1.json
  def destroy
    @my_test_node = MyTest::Node.find(params[:id])
    @my_test_node.destroy

    respond_to do |format|
      format.html { redirect_to my_test_nodes_url }
      format.json { head :ok }
    end
  end

  def tree
    #  tree_json='[{"id":"1","text":"Node 1","state":"closed"},{"id":"2","text":"Node 2","state":"open"},{"id":"3","text":"Node 3","state":"open"},{"id":"4","text":"Node 4","state":"open"}]'
    #render :text=>tree_json
    render :text=>"[#{MyTest::Node.first.to_node.to_json}]"

  end
end
