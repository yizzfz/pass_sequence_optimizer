; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store i32 %n, i32* %n.addr, align 4
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %cmp32 = icmp sgt i32 %n, 0
  br i1 %cmp32, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call144 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %0 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call144, i8** %0, align 8
  br label %for.cond78.preheader.for.end99_crit_edge

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %1 = add i32 %n, 7
  %2 = add i32 %n, -2
  %3 = sext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc23, %for.cond1.preheader.lr.ph
  %indvars.iv133 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next134, %for.inc23 ]
  %indvar128 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %indvar.next129, %for.inc23 ]
  %indvars.iv123 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next124, %for.inc23 ]
  %indvars.iv119 = phi i32 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next120, %for.inc23 ]
  %4 = sub i32 %1, %indvar128
  %5 = sub i32 %2, %indvar128
  %cmp222 = icmp slt i64 %indvars.iv133, 0
  br i1 %cmp222, label %for.cond8.preheader, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.cond1.preheader
  %wide.trip.count121 = zext i32 %indvars.iv119 to i64
  br label %for.inc

for.cond8.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.cond8.preheader.loopexit, %for.cond1.preheader
  %indvars.iv.next134 = add nsw i64 %indvars.iv133, 1
  %cmp925 = icmp slt i64 %indvars.iv.next134, %3
  br i1 %cmp925, label %for.inc16.lr.ph, label %for.inc23.thread

for.inc23.thread:                                 ; preds = %for.cond8.preheader
  %arrayidx22140 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv133
  store double 1.000000e+00, double* %arrayidx22140, align 8
  br label %for.end25

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  %xtraiter130 = and i32 %4, 7
  %lcmp.mod131 = icmp eq i32 %xtraiter130, 0
  br i1 %lcmp.mod131, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol.preheader, %for.inc16.prol
  %indvars.iv125.prol = phi i64 [ %indvars.iv.next126.prol, %for.inc16.prol ], [ %indvars.iv123, %for.inc16.prol.preheader ]
  %prol.iter132 = phi i32 [ %prol.iter132.sub, %for.inc16.prol ], [ %xtraiter130, %for.inc16.prol.preheader ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv125.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next126.prol = add nsw i64 %indvars.iv125.prol, 1
  %prol.iter132.sub = add i32 %prol.iter132, -1
  %prol.iter132.cmp = icmp eq i32 %prol.iter132.sub, 0
  br i1 %prol.iter132.cmp, label %for.inc16.prol.loopexit.loopexit, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.loopexit:                 ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.prol.loopexit.loopexit, %for.inc16.lr.ph
  %indvars.iv125.unr = phi i64 [ %indvars.iv123, %for.inc16.lr.ph ], [ %indvars.iv.next126.prol, %for.inc16.prol.loopexit.loopexit ]
  %6 = icmp ult i32 %5, 7
  br i1 %6, label %for.inc23, label %for.inc16.preheader

for.inc16.preheader:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv116 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next117, %for.inc ]
  %7 = sub nsw i64 0, %indvars.iv116
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv116
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next117, %wide.trip.count121
  br i1 %exitcond122, label %for.cond8.preheader.loopexit, label %for.inc

for.inc16:                                        ; preds = %for.inc16.preheader, %for.inc16
  %indvars.iv125 = phi i64 [ %indvars.iv.next126.7, %for.inc16 ], [ %indvars.iv125.unr, %for.inc16.preheader ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv125
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next126 = add nsw i64 %indvars.iv125, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next126
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next126.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next126.2 = add nsw i64 %indvars.iv125, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next126.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next126.3 = add nsw i64 %indvars.iv125, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next126.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next126.4 = add nsw i64 %indvars.iv125, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next126.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next126.5 = add nsw i64 %indvars.iv125, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next126.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next126.6 = add nsw i64 %indvars.iv125, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv.next126.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next126.7 = add nsw i64 %indvars.iv125, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next126.7 to i32
  %exitcond127.7 = icmp eq i32 %lftr.wideiv.7, %n
  br i1 %exitcond127.7, label %for.inc23.loopexit, label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.inc16.prol.loopexit
  %9 = icmp slt i64 %indvars.iv.next134, %3
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv133, i64 %indvars.iv133
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next120 = add i32 %indvars.iv119, 1
  %indvars.iv.next124 = add nsw i64 %indvars.iv123, 1
  %indvar.next129 = add i32 %indvar128, 1
  br i1 %9, label %for.cond1.preheader, label %for.end25.loopexit

for.end25.loopexit:                               ; preds = %for.inc23
  br label %for.end25

for.end25:                                        ; preds = %for.end25.loopexit, %for.inc23.thread
  %10 = icmp sgt i32 %n, 0
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %11 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %11, align 8
  br i1 %10, label %for.cond30.preheader.us.preheader, label %for.cond78.preheader.for.end99_crit_edge

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %12 = add i32 %n, -1
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 3
  %15 = add nuw nsw i64 %14, 8
  %16 = sext i32 %n to i64
  %17 = add nsw i64 %16, -1
  %xtraiter155 = and i64 %16, 3
  %lcmp.mod = icmp eq i64 %xtraiter155, 0
  br i1 %lcmp.mod, label %for.cond30.preheader.us.prol.loopexit, label %for.cond30.preheader.us.prol.preheader

for.cond30.preheader.us.prol.preheader:           ; preds = %for.cond30.preheader.us.preheader
  %18 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.preheader.us.prol

for.cond30.preheader.us.prol:                     ; preds = %for.cond30.preheader.us.prol, %for.cond30.preheader.us.prol.preheader
  %indvars.iv112.prol = phi i64 [ 0, %for.cond30.preheader.us.prol.preheader ], [ %indvars.iv.next113.prol, %for.cond30.preheader.us.prol ]
  %indvar.prol = phi i64 [ 0, %for.cond30.preheader.us.prol.preheader ], [ %indvar.next.prol, %for.cond30.preheader.us.prol ]
  %prol.iter156 = phi i64 [ %xtraiter155, %for.cond30.preheader.us.prol.preheader ], [ %prol.iter156.sub, %for.cond30.preheader.us.prol ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvar.prol, i64 0
  %scevgep111.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.prol, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next113.prol = add nsw i64 %indvars.iv112.prol, 1
  %indvar.next.prol = add nuw nsw i64 %indvar.prol, 1
  %prol.iter156.sub = add i64 %prol.iter156, -1
  %prol.iter156.cmp = icmp eq i64 %prol.iter156.sub, 0
  br i1 %prol.iter156.cmp, label %for.cond30.preheader.us.prol.loopexit.unr-lcssa, label %for.cond30.preheader.us.prol, !llvm.loop !3

for.cond30.preheader.us.prol.loopexit.unr-lcssa:  ; preds = %for.cond30.preheader.us.prol
  br label %for.cond30.preheader.us.prol.loopexit

for.cond30.preheader.us.prol.loopexit:            ; preds = %for.cond30.preheader.us.preheader, %for.cond30.preheader.us.prol.loopexit.unr-lcssa
  %indvars.iv112.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next113.prol, %for.cond30.preheader.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvar.next.prol, %for.cond30.preheader.us.prol.loopexit.unr-lcssa ]
  %19 = icmp ult i64 %17, 3
  br i1 %19, label %for.cond44.preheader, label %for.cond30.preheader.us.preheader.new

for.cond30.preheader.us.preheader.new:            ; preds = %for.cond30.preheader.us.prol.loopexit
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us, %for.cond30.preheader.us.preheader.new
  %indvars.iv112 = phi i64 [ %indvars.iv112.unr, %for.cond30.preheader.us.preheader.new ], [ %indvars.iv.next113.3, %for.cond30.preheader.us ]
  %indvar = phi i64 [ %indvar.unr, %for.cond30.preheader.us.preheader.new ], [ %indvar.next.3, %for.cond30.preheader.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvar, i64 0
  %scevgep111 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111, i8 0, i64 %15, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvar.next, i64 0
  %scevgep111.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.1, i8 0, i64 %15, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvar.next.1, i64 0
  %scevgep111.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.2, i8 0, i64 %15, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvar.next.2, i64 0
  %scevgep111.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep111.3, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next113.3 = add nsw i64 %indvars.iv112, 4
  %cmp27.us.3 = icmp slt i64 %indvars.iv.next113.3, %16
  %indvar.next.3 = add nsw i64 %indvar, 4
  br i1 %cmp27.us.3, label %for.cond30.preheader.us, label %for.cond44.preheader.unr-lcssa

for.cond44.preheader.unr-lcssa:                   ; preds = %for.cond30.preheader.us
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond30.preheader.us.prol.loopexit, %for.cond44.preheader.unr-lcssa
  %.pre136.pre = load i32, i32* %n.addr, align 4
  %wide.trip.count = zext i32 %.pre136.pre to i64
  %24 = sext i32 %.pre136.pre to i64
  %wide.trip.count95 = zext i32 %.pre136.pre to i64
  %25 = sext i32 %.pre136.pre to i64
  %cmp4518 = icmp sgt i32 %.pre136.pre, 0
  br i1 %cmp4518, label %for.cond48.preheader.us.preheader, label %for.cond78.preheader.for.end99_crit_edge

for.cond48.preheader.us.preheader:                ; preds = %for.cond44.preheader
  %26 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %27 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %xtraiter96 = and i32 %.pre136.pre, 1
  %28 = icmp eq i32 %xtraiter96, 0
  %29 = icmp eq i32 %.pre136.pre, 1
  %sunkaddr = ptrtoint [2000 x double]* %26 to i64
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.us.preheader
  %indvars.iv102 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %indvars.iv.next103, %for.cond48.for.inc75_crit_edge.us ]
  %sunkaddr149 = shl i64 %indvars.iv102, 3
  %sunkaddr150 = add i64 %sunkaddr, %sunkaddr149
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to double*
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %cmp45.us = icmp slt i64 %indvars.iv.next103, %25
  br i1 %cmp45.us, label %for.cond52.preheader.us.us.preheader, label %for.cond78.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv99 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next100, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 %indvars.iv99, i64 %indvars.iv102
  br i1 %28, label %for.inc69.us.us.prol.loopexit.unr-lcssa, label %for.inc69.us.us.prol.preheader

for.inc69.us.us.prol.preheader:                   ; preds = %for.cond52.preheader.us.us
  %30 = load double, double* %arrayidx59.us.us, align 8
  %31 = load double, double* %sunkaddr151, align 8
  %mul.us.us.prol = fmul double %30, %31
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv99, i64 0
  %32 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %mul.us.us.prol, %32
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  br label %for.inc69.us.us.prol.loopexit.unr-lcssa

for.inc69.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.cond52.preheader.us.us, %for.inc69.us.us.prol.preheader
  %indvars.iv93.unr.ph = phi i64 [ 1, %for.inc69.us.us.prol.preheader ], [ 0, %for.cond52.preheader.us.us ]
  br i1 %29, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us.preheader

for.inc69.us.us.preheader:                        ; preds = %for.inc69.us.us.prol.loopexit.unr-lcssa
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %for.inc69.us.us.prol.loopexit.unr-lcssa
  %wide.trip.count101.pre-phi = phi i64 [ 1, %for.inc69.us.us.prol.loopexit.unr-lcssa ], [ %wide.trip.count95, %for.cond52.for.inc72_crit_edge.us.us.loopexit ]
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond = icmp eq i64 %indvars.iv.next100, %wide.trip.count101.pre-phi
  br i1 %exitcond, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us.preheader, %for.inc69.us.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94.1, %for.inc69.us.us ], [ %indvars.iv93.unr.ph, %for.inc69.us.us.preheader ]
  %33 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 %indvars.iv93, i64 %indvars.iv102
  %34 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %33, %34
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv99, i64 %indvars.iv93
  %35 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %35
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %36 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 %indvars.iv.next94, i64 %indvars.iv102
  %37 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %36, %37
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next94
  %38 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %38
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next94.1, %wide.trip.count95
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us

for.cond78.preheader:                             ; preds = %for.cond48.for.inc75_crit_edge.us
  %39 = icmp sgt i32 %.pre136.pre, 0
  br i1 %39, label %for.cond82.preheader.us.preheader, label %for.cond78.preheader.for.end99_crit_edge

for.cond78.preheader.for.end99_crit_edge:         ; preds = %for.cond78.preheader, %for.cond44.preheader, %for.end25, %for.end25.thread
  %sunkaddr153 = bitcast [2000 x [2000 x double]]** %B to i8**
  %.pre138 = load i8*, i8** %sunkaddr153, align 8
  br label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %40 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %41 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %42 = add i32 %.pre136.pre, -1
  %xtraiter = and i32 %.pre136.pre, 3
  %43 = icmp eq i32 %xtraiter, 0
  %44 = icmp ult i32 %42, 3
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv91 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next92, %for.cond82.for.inc97_crit_edge.us ]
  br i1 %43, label %for.inc94.us.prol.loopexit, label %for.inc94.us.prol.preheader

for.inc94.us.prol.preheader:                      ; preds = %for.cond82.preheader.us
  br label %for.inc94.us.prol

for.inc94.us.prol:                                ; preds = %for.inc94.us.prol.preheader, %for.inc94.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc94.us.prol ], [ 0, %for.inc94.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc94.us.prol ], [ %xtraiter, %for.inc94.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv91, i64 %indvars.iv.prol
  %45 = bitcast double* %arrayidx89.us.prol to i64*
  %46 = load i64, i64* %45, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv91, i64 %indvars.iv.prol
  %47 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %46, i64* %47, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc94.us.prol.loopexit.loopexit, label %for.inc94.us.prol, !llvm.loop !4

for.inc94.us.prol.loopexit.loopexit:              ; preds = %for.inc94.us.prol
  br label %for.inc94.us.prol.loopexit

for.inc94.us.prol.loopexit:                       ; preds = %for.inc94.us.prol.loopexit.loopexit, %for.cond82.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond82.preheader.us ], [ %indvars.iv.next.prol, %for.inc94.us.prol.loopexit.loopexit ]
  br i1 %44, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us.preheader

for.inc94.us.preheader:                           ; preds = %for.inc94.us.prol.loopexit
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us.preheader, %for.inc94.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc94.us ], [ %indvars.iv.unr, %for.inc94.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv91, i64 %indvars.iv
  %48 = bitcast double* %arrayidx89.us to i64*
  %49 = load i64, i64* %48, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv91, i64 %indvars.iv
  %50 = bitcast double* %arrayidx93.us to i64*
  store i64 %49, i64* %50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next
  %51 = bitcast double* %arrayidx89.us.1 to i64*
  %52 = load i64, i64* %51, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv91, i64 %indvars.iv.next
  %53 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %52, i64* %53, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %54 = bitcast double* %arrayidx89.us.2 to i64*
  %55 = load i64, i64* %54, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %56 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %55, i64* %56, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %57 = bitcast double* %arrayidx89.us.3 to i64*
  %58 = load i64, i64* %57, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %41, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %59 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %58, i64* %59, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %for.inc94.us.prol.loopexit
  %indvars.iv.next92 = add nsw i64 %indvars.iv91, 1
  %cmp79.us = icmp slt i64 %indvars.iv.next92, %24
  br i1 %cmp79.us, label %for.cond82.preheader.us, label %for.end99.loopexit

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  %60 = bitcast [2000 x [2000 x double]]* %40 to i8*
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.cond78.preheader.for.end99_crit_edge
  %61 = phi i8* [ %.pre138, %for.cond78.preheader.for.end99_crit_edge ], [ %60, %for.end99.loopexit ]
  tail call void @free(i8* %61) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %cmp17 = icmp sgt i32 %n, 0
  br i1 %cmp17, label %for.cond1.preheader.lr.ph, label %for.end58

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = sext i32 %n to i64
  %1 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc56, %for.cond1.preheader.lr.ph
  %indvars.iv43 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next44, %for.inc56 ]
  %indvar = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %indvar.next, %for.inc56 ]
  %indvars.iv37 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next38, %for.inc56 ]
  %2 = add i64 %indvars.iv43, -2
  %cmp210 = icmp sgt i64 %indvars.iv43, 0
  br i1 %cmp210, label %for.cond4.preheader.preheader, label %for.inc56

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 0
  %wide.trip.count34 = zext i32 %indvars.iv37 to i64
  br label %for.cond4.preheader

for.cond28.preheader:                             ; preds = %for.inc25
  %3 = icmp sgt i64 %indvars.iv43, 0
  br i1 %3, label %for.inc45.lr.ph, label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.cond28.preheader
  %xtraiter40 = and i32 %indvar, 1
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  br i1 %lcmp.mod41, label %for.inc45.prol.loopexit.unr-lcssa, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 0
  %4 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %4, %4
  %arrayidx43.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv43
  %5 = load double, double* %arrayidx43.prol, align 8
  %sub44.prol = fsub double %5, %mul39.prol
  store double %sub44.prol, double* %arrayidx43.prol, align 8
  br label %for.inc45.prol.loopexit.unr-lcssa

for.inc45.prol.loopexit.unr-lcssa:                ; preds = %for.inc45.lr.ph, %for.inc45.prol.preheader
  %indvars.iv35.unr.ph = phi i64 [ 1, %for.inc45.prol.preheader ], [ 0, %for.inc45.lr.ph ]
  %6 = icmp eq i32 %indvar, 1
  br i1 %6, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit.unr-lcssa
  %arrayidx43.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv43
  %.pre45 = load double, double* %arrayidx43.phi.trans.insert, align 8
  %wide.trip.count = zext i32 %indvars.iv37 to i64
  %7 = sub i64 %2, %indvars.iv35.unr.ph
  %8 = lshr i64 %7, 1
  %9 = and i64 %8, 1
  %lcmp.mod48 = icmp eq i64 %9, 0
  br i1 %lcmp.mod48, label %for.inc45.prol.preheader47, label %for.inc45.prol.loopexit.unr-lcssa52

for.inc45.prol.preheader47:                       ; preds = %for.inc45.lr.ph.new
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol.preheader47
  %arrayidx34.prol49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv35.unr.ph
  %10 = load double, double* %arrayidx34.prol49, align 8
  %mul39.prol50 = fmul double %10, %10
  %sub44.prol51 = fsub double %.pre45, %mul39.prol50
  store double %sub44.prol51, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.prol = add nuw nsw i64 %indvars.iv35.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next36.prol
  %11 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %11, %11
  %sub44.1.prol = fsub double %sub44.prol51, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.1.prol = or i64 %indvars.iv35.unr.ph, 2
  br label %for.inc45.prol.loopexit.unr-lcssa52

for.inc45.prol.loopexit.unr-lcssa52:              ; preds = %for.inc45.lr.ph.new, %for.inc45.prol
  %.unr.ph = phi double [ %sub44.1.prol, %for.inc45.prol ], [ %.pre45, %for.inc45.lr.ph.new ]
  %indvars.iv35.unr.ph53 = phi i64 [ %indvars.iv.next36.1.prol, %for.inc45.prol ], [ %indvars.iv35.unr.ph, %for.inc45.lr.ph.new ]
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.unr-lcssa52
  %12 = icmp eq i64 %8, 0
  br i1 %12, label %for.inc56.loopexit, label %for.inc45.lr.ph.new.new

for.inc45.lr.ph.new.new:                          ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %indvars.iv30 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next31, %for.inc25 ]
  %13 = add i64 %indvars.iv30, 4294967295
  %cmp56 = icmp sgt i64 %indvars.iv30, 0
  br i1 %cmp56, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %xtraiter46 = and i64 %indvars.iv30, 1
  %lcmp.mod = icmp eq i64 %xtraiter46, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %14 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv30, i64 0
  %15 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %14, %15
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv30
  %16 = load double, double* %arrayidx16.prol, align 8
  %sub.prol = fsub double %16, %mul.prol
  store double %sub.prol, double* %arrayidx16.prol, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %17 = trunc i64 %13 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv30
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %19 = phi double [ %.pre, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv
  %20 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv30, i64 %indvars.iv
  %21 = load double, double* %arrayidx12, align 8
  %mul = fmul double %20, %21
  %sub = fsub double %19, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv30, i64 %indvars.iv.next
  %23 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %22, %23
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv30
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit.unr-lcssa, %for.cond4.preheader
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv30, i64 %indvars.iv30
  %24 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv30
  %25 = load double, double* %arrayidx24, align 8
  %div = fdiv double %25, %24
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %wide.trip.count34
  br i1 %exitcond, label %for.cond28.preheader, label %for.cond4.preheader

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new.new
  %26 = phi double [ %.unr.ph, %for.inc45.lr.ph.new.new ], [ %sub44.1.1, %for.inc45 ]
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph53, %for.inc45.lr.ph.new.new ], [ %indvars.iv.next36.1.1, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv35
  %27 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %27, %27
  %sub44 = fsub double %26, %mul39
  store double %sub44, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next36
  %28 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %28, %28
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %arrayidx34.154 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next36.1
  %29 = load double, double* %arrayidx34.154, align 8
  %mul39.155 = fmul double %29, %29
  %sub44.156 = fsub double %sub44.1, %mul39.155
  store double %sub44.156, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.157 = add nsw i64 %indvars.iv35, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next36.157
  %30 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %30, %30
  %sub44.1.1 = fsub double %sub44.156, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next36.1.1 = add nsw i64 %indvars.iv35, 4
  %exitcond39.1.1 = icmp eq i64 %indvars.iv.next36.1.1, %wide.trip.count
  br i1 %exitcond39.1.1, label %for.inc56.loopexit.unr-lcssa, label %for.inc45

for.inc56.loopexit.unr-lcssa:                     ; preds = %for.inc45
  br label %for.inc56.loopexit

for.inc56.loopexit:                               ; preds = %for.inc45.prol.loopexit, %for.inc56.loopexit.unr-lcssa
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit.unr-lcssa, %for.cond28.preheader, %for.cond1.preheader
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv43
  %31 = load double, double* %arrayidx51, align 8
  %call = tail call double @sqrt(double %31) #3
  store double %call, double* %arrayidx51, align 8
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  %cmp = icmp slt i64 %indvars.iv.next44, %0
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.end58.loopexit

for.end58.loopexit:                               ; preds = %for.inc56
  br label %for.end58

for.end58:                                        ; preds = %for.end58.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.lr.ph, label %for.end12

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.lr.ph
  %indvars.iv11 = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next12, %for.inc10 ]
  %indvars.iv9 = phi i32 [ 1, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next10, %for.inc10 ]
  %cmp32 = icmp slt i64 %indvars.iv11, 0
  br i1 %cmp32, label %for.inc10, label %for.body4.preheader

for.body4.preheader:                              ; preds = %for.cond2.preheader
  %4 = mul nsw i64 %3, %indvars.iv11
  %wide.trip.count = zext i32 %indvars.iv9 to i64
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.preheader
  %indvars.iv = phi i64 [ 0, %for.body4.preheader ], [ %indvars.iv.next, %for.inc ]
  %5 = add nsw i64 %4, %indvars.iv
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10.loopexit, label %for.body4

for.inc10.loopexit:                               ; preds = %for.inc
  br label %for.inc10

for.inc10:                                        ; preds = %for.inc10.loopexit, %for.cond2.preheader
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %cmp = icmp slt i64 %indvars.iv.next12, %3
  %indvars.iv.next10 = add i32 %indvars.iv9, 1
  br i1 %cmp, label %for.cond2.preheader, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
