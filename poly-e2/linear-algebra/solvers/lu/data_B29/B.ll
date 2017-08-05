; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %cmp91 = icmp sgt i32 %n, 0
  br i1 %cmp91, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call142 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = add i32 %n, -2
  %1 = zext i32 %0 to i64
  %2 = sext i32 %n to i64
  %wide.trip.count138 = zext i32 %n to i64
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.end18, %for.cond1.preheader.lr.ph
  %indvars.iv136 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next137, %for.end18 ]
  %indvars.iv134 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next135, %for.end18 ]
  %3 = add nuw nsw i64 %indvars.iv136, 1
  %4 = sub i64 %1, %indvars.iv136
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %cmp989 = icmp slt i64 %indvars.iv.next137, %2
  br i1 %cmp989, label %for.end18.loopexit, label %for.end18

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv118 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next119, %for.body3 ]
  %7 = sub nsw i64 0, %indvars.iv118
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv118
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next119, %indvars.iv134
  br i1 %exitcond124, label %for.cond8.preheader, label %for.body3

for.end18.loopexit:                               ; preds = %for.cond8.preheader
  %9 = add nuw nsw i64 %6, 8
  %scevgep131 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %3
  %10 = mul nuw nsw i64 %indvars.iv136, 2000
  %scevgep132 = getelementptr double, double* %scevgep131, i64 %10
  %scevgep132133 = bitcast double* %scevgep132 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep132133, i8 0, i64 %9, i32 8, i1 false)
  br label %for.end18

for.end18:                                        ; preds = %for.cond8.preheader, %for.end18.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv136
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond139 = icmp eq i64 %indvars.iv.next137, %wide.trip.count138
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  br i1 %exitcond139, label %for.end25, label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %11 = icmp sgt i32 %n, 0
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 %11, label %for.cond30.preheader.us.preheader, label %for.end99

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %12 = add i32 %n, -1
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 3
  %15 = add nuw nsw i64 %14, 8
  %16 = zext i32 %n to i64
  %17 = add nsw i64 %16, -1
  %xtraiter195 = and i64 %wide.trip.count138, 7
  %lcmp.mod196 = icmp eq i64 %xtraiter195, 0
  br i1 %lcmp.mod196, label %for.cond30.for.end40_crit_edge.us.prol.loopexit, label %for.cond30.for.end40_crit_edge.us.prol.preheader

for.cond30.for.end40_crit_edge.us.prol.preheader: ; preds = %for.cond30.preheader.us.preheader
  br label %for.cond30.for.end40_crit_edge.us.prol

for.cond30.for.end40_crit_edge.us.prol:           ; preds = %for.cond30.for.end40_crit_edge.us.prol, %for.cond30.for.end40_crit_edge.us.prol.preheader
  %indvars.iv114.prol = phi i64 [ 0, %for.cond30.for.end40_crit_edge.us.prol.preheader ], [ %indvars.iv.next115.prol, %for.cond30.for.end40_crit_edge.us.prol ]
  %prol.iter197 = phi i64 [ %xtraiter195, %for.cond30.for.end40_crit_edge.us.prol.preheader ], [ %prol.iter197.sub, %for.cond30.for.end40_crit_edge.us.prol ]
  %18 = mul nuw nsw i64 %indvars.iv114.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next115.prol = add nuw nsw i64 %indvars.iv114.prol, 1
  %prol.iter197.sub = add i64 %prol.iter197, -1
  %prol.iter197.cmp = icmp eq i64 %prol.iter197.sub, 0
  br i1 %prol.iter197.cmp, label %for.cond30.for.end40_crit_edge.us.prol.loopexit.unr-lcssa, label %for.cond30.for.end40_crit_edge.us.prol, !llvm.loop !1

for.cond30.for.end40_crit_edge.us.prol.loopexit.unr-lcssa: ; preds = %for.cond30.for.end40_crit_edge.us.prol
  br label %for.cond30.for.end40_crit_edge.us.prol.loopexit

for.cond30.for.end40_crit_edge.us.prol.loopexit:  ; preds = %for.cond30.preheader.us.preheader, %for.cond30.for.end40_crit_edge.us.prol.loopexit.unr-lcssa
  %indvars.iv114.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next115.prol, %for.cond30.for.end40_crit_edge.us.prol.loopexit.unr-lcssa ]
  %19 = icmp ult i64 %17, 7
  br i1 %19, label %for.cond44.preheader, label %for.cond30.preheader.us.preheader.new

for.cond30.preheader.us.preheader.new:            ; preds = %for.cond30.for.end40_crit_edge.us.prol.loopexit
  br label %for.cond30.for.end40_crit_edge.us

for.cond30.for.end40_crit_edge.us:                ; preds = %for.cond30.for.end40_crit_edge.us, %for.cond30.preheader.us.preheader.new
  %indvars.iv114 = phi i64 [ %indvars.iv114.unr, %for.cond30.preheader.us.preheader.new ], [ %indvars.iv.next115.7, %for.cond30.for.end40_crit_edge.us ]
  %20 = mul nuw nsw i64 %indvars.iv114, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %15, i32 8, i1 false)
  %21 = mul i64 %indvars.iv114, 16000
  %22 = add i64 %21, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %15, i32 8, i1 false)
  %23 = mul i64 %indvars.iv114, 16000
  %24 = add i64 %23, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %15, i32 8, i1 false)
  %25 = mul i64 %indvars.iv114, 16000
  %26 = add i64 %25, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %15, i32 8, i1 false)
  %27 = mul i64 %indvars.iv114, 16000
  %28 = add i64 %27, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %15, i32 8, i1 false)
  %29 = mul i64 %indvars.iv114, 16000
  %30 = add i64 %29, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %15, i32 8, i1 false)
  %31 = mul i64 %indvars.iv114, 16000
  %32 = add i64 %31, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next115.6 = add nsw i64 %indvars.iv114, 7
  %33 = mul nuw nsw i64 %indvars.iv.next115.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %15, i32 8, i1 false)
  %exitcond141.7 = icmp eq i64 %indvars.iv.next115.6, %17
  %indvars.iv.next115.7 = add nsw i64 %indvars.iv114, 8
  br i1 %exitcond141.7, label %for.cond44.preheader.unr-lcssa, label %for.cond30.for.end40_crit_edge.us

for.cond44.preheader.unr-lcssa:                   ; preds = %for.cond30.for.end40_crit_edge.us
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond30.for.end40_crit_edge.us.prol.loopexit, %for.cond44.preheader.unr-lcssa
  %34 = icmp sgt i32 %n, 0
  br i1 %34, label %for.cond48.preheader.lr.ph, label %for.end99

for.cond48.preheader.lr.ph:                       ; preds = %for.cond44.preheader
  %35 = zext i32 %n to i64
  %36 = add nsw i64 %35, -1
  %wide.trip.count104 = zext i32 %n to i64
  %wide.trip.count108 = zext i32 %n to i64
  %37 = shl nuw nsw i64 %wide.trip.count138, 3
  %38 = add nsw i64 %wide.trip.count138, -1
  %min.iters.check = icmp ult i32 %n, 4
  %39 = bitcast i8* %call to [2000 x [2000 x double]]*
  %40 = bitcast i8* %call to [2000 x [2000 x double]]*
  %41 = bitcast i8* %call to [2000 x [2000 x double]]*
  %42 = and i32 %n, 3
  %n.mod.vf = zext i32 %42 to i64
  %n.vec = sub nsw i64 %wide.trip.count138, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %43 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.n = icmp eq i32 %42, 0
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.end74_crit_edge.us, %for.cond48.preheader.lr.ph
  %indvars.iv106 = phi i64 [ 0, %for.cond48.preheader.lr.ph ], [ %indvars.iv.next107, %for.cond48.for.end74_crit_edge.us ]
  %scevgep152 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv106
  %scevgep152153 = bitcast double* %scevgep152 to i8*
  %44 = add i64 %indvars.iv106, -1999
  %scevgep154 = getelementptr [2000 x double], [2000 x double]* %A, i64 %wide.trip.count138, i64 %44
  %scevgep154155 = bitcast double* %scevgep154 to i8*
  br label %for.cond52.preheader.us.us

for.cond48.for.end74_crit_edge.us:                ; preds = %for.cond52.for.end71_crit_edge.us.us
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next107, %wide.trip.count108
  br i1 %exitcond109, label %for.cond78.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.end71_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv102 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next103, %for.cond52.for.end71_crit_edge.us.us ]
  %45 = mul i64 %indvars.iv102, 16000
  %scevgep150 = getelementptr i8, i8* %call, i64 %45
  %46 = add i64 %37, %45
  %scevgep151 = getelementptr i8, i8* %call, i64 %46
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv102, i64 %indvars.iv106
  br i1 %min.iters.check, label %for.body55.us.us.preheader, label %min.iters.checked

for.body55.us.us.preheader:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond52.preheader.us.us
  %indvars.iv98.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond52.preheader.us.us ], [ %n.vec, %middle.block ]
  %47 = sub nsw i64 %wide.trip.count138, %indvars.iv98.ph
  %xtraiter193 = and i64 %47, 1
  %lcmp.mod194 = icmp eq i64 %xtraiter193, 0
  br i1 %lcmp.mod194, label %for.body55.us.us.prol.loopexit.unr-lcssa, label %for.body55.us.us.prol.preheader

for.body55.us.us.prol.preheader:                  ; preds = %for.body55.us.us.preheader
  br label %for.body55.us.us.prol

for.body55.us.us.prol:                            ; preds = %for.body55.us.us.prol.preheader
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98.ph, i64 %indvars.iv106
  %49 = load double, double* %arrayidx63.us.us.prol, align 8
  %mul.us.us.prol = fmul double %48, %49
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv102, i64 %indvars.iv98.ph
  %50 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %50, %mul.us.us.prol
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  %indvars.iv.next99.prol = add nuw nsw i64 %indvars.iv98.ph, 1
  br label %for.body55.us.us.prol.loopexit.unr-lcssa

for.body55.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.body55.us.us.preheader, %for.body55.us.us.prol
  %indvars.iv98.unr.ph = phi i64 [ %indvars.iv.next99.prol, %for.body55.us.us.prol ], [ %indvars.iv98.ph, %for.body55.us.us.preheader ]
  br label %for.body55.us.us.prol.loopexit

for.body55.us.us.prol.loopexit:                   ; preds = %for.body55.us.us.prol.loopexit.unr-lcssa
  %51 = icmp eq i64 %38, %indvars.iv98.ph
  br i1 %51, label %for.cond52.for.end71_crit_edge.us.us.loopexit, label %for.body55.us.us.preheader.new

for.body55.us.us.preheader.new:                   ; preds = %for.body55.us.us.prol.loopexit
  br label %for.body55.us.us

min.iters.checked:                                ; preds = %for.cond52.preheader.us.us
  br i1 %cmp.zero, label %for.body55.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep150, %scevgep154155
  %bound1 = icmp ult i8* %scevgep152153, %scevgep151
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bc156 = bitcast double* %arrayidx59.us.us to i8*
  %bound0157 = icmp ult i8* %scevgep150, %bc156
  %bound1158 = icmp ult i8* %bc, %scevgep151
  %found.conflict159 = and i1 %bound0157, %bound1158
  %conflict.rdx = or i1 %found.conflict, %found.conflict159
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %52 = or i64 %index, 1
  %53 = or i64 %index, 2
  %54 = or i64 %index, 3
  %55 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = insertelement <2 x double> undef, double %55, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv106
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %52, i64 %indvars.iv106
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %53, i64 %indvars.iv106
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %54, i64 %indvars.iv106
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = load double, double* %61, align 8, !alias.scope !6
  %66 = load double, double* %62, align 8, !alias.scope !6
  %67 = load double, double* %63, align 8, !alias.scope !6
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = fmul <2 x double> %57, %69
  %73 = fmul <2 x double> %59, %71
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv102, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !8, !noalias !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %78 = fadd <2 x double> %wide.load, %72
  %79 = fadd <2 x double> %wide.load161, %73
  %80 = bitcast double* %74 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !8, !noalias !10
  %81 = bitcast double* %76 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, %n.vec
  br i1 %82, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond52.for.end71_crit_edge.us.us, label %for.body55.us.us.preheader

for.cond52.for.end71_crit_edge.us.us.loopexit.unr-lcssa: ; preds = %for.body55.us.us
  br label %for.cond52.for.end71_crit_edge.us.us.loopexit

for.cond52.for.end71_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us.prol.loopexit, %for.cond52.for.end71_crit_edge.us.us.loopexit.unr-lcssa
  br label %for.cond52.for.end71_crit_edge.us.us

for.cond52.for.end71_crit_edge.us.us:             ; preds = %for.cond52.for.end71_crit_edge.us.us.loopexit, %middle.block
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, %wide.trip.count104
  br i1 %exitcond105, label %for.cond48.for.end74_crit_edge.us, label %for.cond52.preheader.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.body55.us.us.preheader.new
  %indvars.iv98 = phi i64 [ %indvars.iv98.unr.ph, %for.body55.us.us.preheader.new ], [ %indvars.iv.next99.1, %for.body55.us.us ]
  %83 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv106
  %84 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %83, %84
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv102, i64 %indvars.iv98
  %85 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %85, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %86 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next99, i64 %indvars.iv106
  %87 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %86, %87
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next99
  %88 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %88, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next99, %36
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  br i1 %exitcond.1, label %for.cond52.for.end71_crit_edge.us.us.loopexit.unr-lcssa, label %for.body55.us.us, !llvm.loop !14

for.cond78.preheader:                             ; preds = %for.cond48.for.end74_crit_edge.us
  %89 = icmp sgt i32 %n, 0
  br i1 %89, label %for.cond82.preheader.us.preheader, label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %90 = zext i32 %n to i64
  %91 = add nsw i64 %90, -1
  %wide.trip.count96 = zext i32 %n to i64
  %92 = shl nuw nsw i64 %wide.trip.count138, 3
  %93 = add nsw i64 %wide.trip.count138, -1
  %min.iters.check165 = icmp ult i32 %n, 4
  %94 = bitcast i8* %call to [2000 x [2000 x double]]*
  %95 = bitcast i8* %call to [2000 x [2000 x double]]*
  %96 = bitcast i8* %call to [2000 x [2000 x double]]*
  %97 = bitcast i8* %call to [2000 x [2000 x double]]*
  %98 = bitcast i8* %call to [2000 x [2000 x double]]*
  %99 = and i32 %n, 3
  %n.mod.vf167 = zext i32 %99 to i64
  %n.vec168 = sub nsw i64 %wide.trip.count138, %n.mod.vf167
  %cmp.zero169 = icmp eq i64 %n.vec168, 0
  %100 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.n186 = icmp eq i32 %99, 0
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.end96_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv94 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next95, %for.cond82.for.end96_crit_edge.us ]
  %scevgep171 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 0
  %scevgep171172 = bitcast double* %scevgep171 to i8*
  %scevgep173 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 %wide.trip.count138
  %scevgep173174 = bitcast double* %scevgep173 to i8*
  %101 = mul i64 %indvars.iv94, 16000
  %scevgep175 = getelementptr i8, i8* %call, i64 %101
  %102 = add i64 %92, %101
  %scevgep176 = getelementptr i8, i8* %call, i64 %102
  br i1 %min.iters.check165, label %for.body85.us.preheader, label %min.iters.checked166

min.iters.checked166:                             ; preds = %for.cond82.preheader.us
  br i1 %cmp.zero169, label %for.body85.us.preheader, label %vector.memcheck181

vector.memcheck181:                               ; preds = %min.iters.checked166
  %bound0177 = icmp ult i8* %scevgep171172, %scevgep176
  %bound1178 = icmp ult i8* %scevgep175, %scevgep173174
  %memcheck.conflict180 = and i1 %bound0177, %bound1178
  br i1 %memcheck.conflict180, label %for.body85.us.preheader, label %vector.body162.preheader

vector.body162.preheader:                         ; preds = %vector.memcheck181
  br label %vector.body162

vector.body162:                                   ; preds = %vector.body162.preheader, %vector.body162
  %index183 = phi i64 [ %index.next184, %vector.body162 ], [ 0, %vector.body162.preheader ]
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv94, i64 %index183
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !15
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !15
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 %index183
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load191, <2 x i64>* %108, align 8, !alias.scope !18, !noalias !15
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %wide.load192, <2 x i64>* %110, align 8, !alias.scope !18, !noalias !15
  %index.next184 = add i64 %index183, 4
  %111 = icmp eq i64 %index.next184, %n.vec168
  br i1 %111, label %middle.block163, label %vector.body162, !llvm.loop !20

middle.block163:                                  ; preds = %vector.body162
  br i1 %cmp.n186, label %for.cond82.for.end96_crit_edge.us, label %for.body85.us.preheader

for.body85.us.preheader:                          ; preds = %middle.block163, %vector.memcheck181, %min.iters.checked166, %for.cond82.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck181 ], [ 0, %min.iters.checked166 ], [ 0, %for.cond82.preheader.us ], [ %n.vec168, %middle.block163 ]
  %112 = sub nsw i64 %wide.trip.count138, %indvars.iv.ph
  %113 = sub nsw i64 %93, %indvars.iv.ph
  %xtraiter = and i64 %112, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body85.us.prol.loopexit, label %for.body85.us.prol.preheader

for.body85.us.prol.preheader:                     ; preds = %for.body85.us.preheader
  br label %for.body85.us.prol

for.body85.us.prol:                               ; preds = %for.body85.us.prol, %for.body85.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body85.us.prol ], [ %indvars.iv.ph, %for.body85.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body85.us.prol ], [ %xtraiter, %for.body85.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv94, i64 %indvars.iv.prol
  %114 = bitcast double* %arrayidx89.us.prol to i64*
  %115 = load i64, i64* %114, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 %indvars.iv.prol
  %116 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %115, i64* %116, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body85.us.prol.loopexit.unr-lcssa, label %for.body85.us.prol, !llvm.loop !21

for.body85.us.prol.loopexit.unr-lcssa:            ; preds = %for.body85.us.prol
  br label %for.body85.us.prol.loopexit

for.body85.us.prol.loopexit:                      ; preds = %for.body85.us.preheader, %for.body85.us.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body85.us.preheader ], [ %indvars.iv.next.prol, %for.body85.us.prol.loopexit.unr-lcssa ]
  %117 = icmp ult i64 %113, 3
  br i1 %117, label %for.cond82.for.end96_crit_edge.us.loopexit, label %for.body85.us.preheader.new

for.body85.us.preheader.new:                      ; preds = %for.body85.us.prol.loopexit
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body85.us.preheader.new ], [ %indvars.iv.next.3, %for.body85.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv94, i64 %indvars.iv
  %118 = bitcast double* %arrayidx89.us to i64*
  %119 = load i64, i64* %118, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 %indvars.iv
  %120 = bitcast double* %arrayidx93.us to i64*
  store i64 %119, i64* %120, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %95, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next
  %121 = bitcast double* %arrayidx89.us.1 to i64*
  %122 = load i64, i64* %121, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 %indvars.iv.next
  %123 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %122, i64* %123, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next.1
  %124 = bitcast double* %arrayidx89.us.2 to i64*
  %125 = load i64, i64* %124, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 %indvars.iv.next.1
  %126 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %125, i64* %126, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next.2
  %127 = bitcast double* %arrayidx89.us.3 to i64*
  %128 = load i64, i64* %127, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 %indvars.iv.next.2
  %129 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %128, i64* %129, align 8
  %exitcond140.3 = icmp eq i64 %indvars.iv.next.2, %91
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond140.3, label %for.cond82.for.end96_crit_edge.us.loopexit.unr-lcssa, label %for.body85.us, !llvm.loop !22

for.cond82.for.end96_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body85.us
  br label %for.cond82.for.end96_crit_edge.us.loopexit

for.cond82.for.end96_crit_edge.us.loopexit:       ; preds = %for.body85.us.prol.loopexit, %for.cond82.for.end96_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond82.for.end96_crit_edge.us

for.cond82.for.end96_crit_edge.us:                ; preds = %for.cond82.for.end96_crit_edge.us.loopexit, %middle.block163
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next95, %wide.trip.count96
  br i1 %exitcond97, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.end96_crit_edge.us
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.end25.thread, %for.end25, %for.cond44.preheader, %for.cond78.preheader
  %call143145148 = phi i8* [ %call, %for.cond78.preheader ], [ %call, %for.cond44.preheader ], [ %call, %for.end25 ], [ %call142, %for.end25.thread ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call143145148) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %cmp39 = icmp sgt i32 %n, 0
  br i1 %cmp39, label %for.cond1.preheader.preheader, label %for.end56

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count64 = zext i32 %n to i64
  %wide.trip.count68 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.end53
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.end53 ], [ 0, %for.cond1.preheader.preheader ]
  %cmp233 = icmp sgt i64 %indvars.iv66, 0
  br i1 %cmp233, label %for.cond4.preheader.preheader, label %for.end53

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.end
  %0 = icmp sgt i64 %indvars.iv66, 0
  br i1 %0, label %for.cond31.preheader.us.preheader, label %for.end53

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter70 = and i64 %indvars.iv66, 1
  %lcmp.mod71 = icmp eq i64 %xtraiter70, 0
  %1 = icmp eq i64 %indvars.iv66, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.end50_crit_edge.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.cond31.for.end50_crit_edge.us ], [ %indvars.iv66, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv62
  %.pre44 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod71, label %for.body33.us.prol.loopexit.unr-lcssa, label %for.body33.us.prol.preheader

for.body33.us.prol.preheader:                     ; preds = %for.cond31.preheader.us
  br label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.body33.us.prol.preheader
  %2 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv62
  %3 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %.pre44, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit.unr-lcssa

for.body33.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond31.preheader.us, %for.body33.us.prol
  %indvars.iv55.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr72.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre44, %for.cond31.preheader.us ]
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol.loopexit.unr-lcssa
  br i1 %1, label %for.cond31.for.end50_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.cond31.preheader.us.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next56.1, %for.body33.us ]
  %4 = phi double [ %.unr72.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.body33.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv55
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv62
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv.next56
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next56, i64 %indvars.iv62
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next56.1, %indvars.iv66
  br i1 %exitcond59.1, label %for.cond31.for.end50_crit_edge.us.unr-lcssa, label %for.body33.us

for.cond31.for.end50_crit_edge.us.unr-lcssa:      ; preds = %for.body33.us
  br label %for.cond31.for.end50_crit_edge.us

for.cond31.for.end50_crit_edge.us:                ; preds = %for.body33.us.prol.loopexit, %for.cond31.for.end50_crit_edge.us.unr-lcssa
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, %wide.trip.count64
  br i1 %exitcond65, label %for.end53.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %cmp531 = icmp sgt i64 %indvars.iv48, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv48
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp531, label %for.body6.preheader, label %for.end

for.body6.preheader:                              ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv48, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.preheader
  br label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.prol.preheader
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.preheader, %for.body6.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.preheader ]
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  %11 = icmp eq i64 %indvars.iv48, 1
  br i1 %11, label %for.end.loopexit, label %for.body6.preheader.new

for.body6.preheader.new:                          ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.preheader.new ], [ %indvars.iv.next.1, %for.body6 ]
  %12 = phi double [ %.unr.ph, %for.body6.preheader.new ], [ %sub.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv48
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv48
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv48
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body6

for.end.loopexit.unr-lcssa:                       ; preds = %for.body6
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body6.prol.loopexit, %for.end.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %sub.1, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond4.preheader
  %17 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv48
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next49, %indvars.iv66
  br i1 %exitcond53, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.end53.loopexit:                               ; preds = %for.cond31.for.end50_crit_edge.us
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %for.cond1.preheader, %for.cond31.preheader.lr.ph
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %for.end56.loopexit, label %for.cond1.preheader

for.end56.loopexit:                               ; preds = %for.end53
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count16 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.end_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %wide.trip.count16
  br i1 %exitcond17, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
