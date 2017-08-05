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
  %arraydecay3 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %cmp89 = icmp sgt i32 %n, 0
  br i1 %cmp89, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call127 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = add i32 %n, -1
  %1 = sext i32 %n to i64
  %2 = sext i32 %n to i64
  %3 = sext i32 %0 to i64
  %4 = add nsw i64 %3, 1
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.end18, %for.cond1.preheader.lr.ph
  %indvars.iv121 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next122, %for.end18 ]
  %5 = shl i64 %indvars.iv121, 32
  %sext = add nuw nsw i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %scevgep125 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %6
  %7 = sub nsw i64 %4, %6
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.body3 ], [ 0, %for.body3.lr.ph ]
  %8 = sub nsw i64 0, %indvars.iv108
  %9 = trunc i64 %8 to i32
  %rem = srem i32 %9, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv108
  store double %add, double* %arrayidx6, align 8
  %exitcond114 = icmp eq i64 %indvars.iv108, %indvars.iv121
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  br i1 %exitcond114, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %scevgep125126 = bitcast double* %scevgep125 to i8*
  %10 = shl nsw i64 %7, 3
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %cmp986 = icmp slt i64 %indvars.iv.next122, %1
  br i1 %cmp986, label %for.end18.loopexit, label %for.end18

for.end18.loopexit:                               ; preds = %for.end
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep125126, i8 0, i64 %10, i32 8, i1 false)
  br label %for.end18

for.end18:                                        ; preds = %for.end, %for.end18.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv121
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond190 = icmp ne i64 %indvars.iv.next122, %2
  br i1 %exitcond190, label %for.body3.lr.ph, label %for.end25

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %11 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp2777 = icmp sgt i32 %n, 0
  br i1 %cmp2777, label %for.cond30.preheader.us.preheader, label %for.end99

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %12 = add i32 %n, -1
  %13 = sext i32 %n to i64
  %14 = zext i32 %12 to i64
  %15 = shl nuw nsw i64 %14, 3
  %16 = add nuw nsw i64 %15, 8
  %17 = add nsw i64 %13, -1
  %xtraiter185 = and i64 %13, 7
  %lcmp.mod186 = icmp eq i64 %xtraiter185, 0
  br i1 %lcmp.mod186, label %for.cond30.for.inc41_crit_edge.us.prol.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol.preheader

for.cond30.for.inc41_crit_edge.us.prol.preheader: ; preds = %for.cond30.preheader.us.preheader
  br label %for.cond30.for.inc41_crit_edge.us.prol

for.cond30.for.inc41_crit_edge.us.prol:           ; preds = %for.cond30.for.inc41_crit_edge.us.prol, %for.cond30.for.inc41_crit_edge.us.prol.preheader
  %indvars.iv106.prol = phi i64 [ 0, %for.cond30.for.inc41_crit_edge.us.prol.preheader ], [ %indvars.iv.next107.prol, %for.cond30.for.inc41_crit_edge.us.prol ]
  %prol.iter187 = phi i64 [ %xtraiter185, %for.cond30.for.inc41_crit_edge.us.prol.preheader ], [ %prol.iter187.sub, %for.cond30.for.inc41_crit_edge.us.prol ]
  %18 = mul nuw nsw i64 %indvars.iv106.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %16, i32 8, i1 false)
  %indvars.iv.next107.prol = add nuw nsw i64 %indvars.iv106.prol, 1
  %prol.iter187.sub = add nsw i64 %prol.iter187, -1
  %prol.iter187.cmp = icmp eq i64 %prol.iter187.sub, 0
  br i1 %prol.iter187.cmp, label %for.cond30.for.inc41_crit_edge.us.prol.loopexit.unr-lcssa, label %for.cond30.for.inc41_crit_edge.us.prol, !llvm.loop !1

for.cond30.for.inc41_crit_edge.us.prol.loopexit.unr-lcssa: ; preds = %for.cond30.for.inc41_crit_edge.us.prol
  br label %for.cond30.for.inc41_crit_edge.us.prol.loopexit

for.cond30.for.inc41_crit_edge.us.prol.loopexit:  ; preds = %for.cond30.preheader.us.preheader, %for.cond30.for.inc41_crit_edge.us.prol.loopexit.unr-lcssa
  %indvars.iv106.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %xtraiter185, %for.cond30.for.inc41_crit_edge.us.prol.loopexit.unr-lcssa ]
  %19 = icmp ult i64 %17, 7
  br i1 %19, label %for.cond44.preheader, label %for.cond30.preheader.us.preheader.new

for.cond30.preheader.us.preheader.new:            ; preds = %for.cond30.for.inc41_crit_edge.us.prol.loopexit
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.cond30.preheader.us.preheader.new
  %indvars.iv106 = phi i64 [ %indvars.iv106.unr, %for.cond30.preheader.us.preheader.new ], [ %indvars.iv.next107.7, %for.cond30.for.inc41_crit_edge.us ]
  %20 = mul i64 %indvars.iv106, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %16, i32 8, i1 false)
  %21 = mul i64 %indvars.iv106, 16000
  %22 = add i64 %21, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %16, i32 8, i1 false)
  %23 = mul i64 %indvars.iv106, 16000
  %24 = add i64 %23, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %16, i32 8, i1 false)
  %25 = mul i64 %indvars.iv106, 16000
  %26 = add i64 %25, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %16, i32 8, i1 false)
  %27 = mul i64 %indvars.iv106, 16000
  %28 = add i64 %27, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %16, i32 8, i1 false)
  %29 = mul i64 %indvars.iv106, 16000
  %30 = add i64 %29, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %16, i32 8, i1 false)
  %31 = mul i64 %indvars.iv106, 16000
  %32 = add i64 %31, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %16, i32 8, i1 false)
  %33 = mul i64 %indvars.iv106, 16000
  %34 = add i64 %33, 112000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %16, i32 8, i1 false)
  %indvars.iv.next107.7 = add i64 %indvars.iv106, 8
  %cmp27.us.7 = icmp slt i64 %indvars.iv.next107.7, %13
  br i1 %cmp27.us.7, label %for.cond30.for.inc41_crit_edge.us, label %for.cond44.preheader.unr-lcssa

for.cond44.preheader.unr-lcssa:                   ; preds = %for.cond30.for.inc41_crit_edge.us
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond30.for.inc41_crit_edge.us.prol.loopexit, %for.cond44.preheader.unr-lcssa
  %cmp4537 = icmp sgt i32 %n, 0
  br i1 %cmp4537, label %for.cond48.preheader.lr.ph, label %for.end99

for.cond48.preheader.lr.ph:                       ; preds = %for.cond44.preheader
  %35 = add i32 %n, -1
  %36 = sext i32 %n to i64
  %wide.trip.count96 = zext i32 %35 to i64
  %37 = add nuw nsw i64 %wide.trip.count96, 1
  %38 = shl nuw nsw i64 %wide.trip.count96, 3
  %39 = add nuw nsw i64 %38, 8
  %40 = add nuw nsw i64 %wide.trip.count96, 1
  %min.iters.check = icmp ult i64 %37, 4
  %n.vec = and i64 %37, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %37, %n.vec
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.lr.ph
  %indvars.iv100 = phi i64 [ 0, %for.cond48.preheader.lr.ph ], [ %indvars.iv.next101, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep140 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv100
  %scevgep140141 = bitcast double* %scevgep140 to i8*
  %41 = add nuw nsw i64 %indvars.iv100, 1
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %A, i64 %wide.trip.count96, i64 %41
  %scevgep142143 = bitcast double* %scevgep142 to i8*
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond189 = icmp ne i64 %indvars.iv.next101, %36
  br i1 %exitcond189, label %for.cond52.preheader.us.us.preheader, label %for.cond78.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv98 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next99, %for.cond52.for.inc72_crit_edge.us.us ]
  %42 = mul nuw nsw i64 %indvars.iv98, 16000
  %scevgep138 = getelementptr i8, i8* %call, i64 %42
  %43 = add nuw nsw i64 %39, %42
  %scevgep139 = getelementptr i8, i8* %call, i64 %43
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98, i64 %indvars.iv100
  br i1 %min.iters.check, label %for.body55.us.us.preheader, label %min.iters.checked

for.body55.us.us.preheader:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond52.preheader.us.us
  %indvars.iv94.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond52.preheader.us.us ], [ %n.vec, %middle.block ]
  %44 = sub nsw i64 %40, %indvars.iv94.ph
  %xtraiter183 = and i64 %44, 1
  %lcmp.mod184 = icmp eq i64 %xtraiter183, 0
  br i1 %lcmp.mod184, label %for.body55.us.us.prol.loopexit.unr-lcssa, label %for.body55.us.us.prol.preheader

for.body55.us.us.prol.preheader:                  ; preds = %for.body55.us.us.preheader
  br label %for.body55.us.us.prol

for.body55.us.us.prol:                            ; preds = %for.body55.us.us.prol.preheader
  %45 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94.ph, i64 %indvars.iv100
  %46 = load double, double* %arrayidx63.us.us.prol, align 8
  %mul.us.us.prol = fmul double %45, %46
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv98, i64 %indvars.iv94.ph
  %47 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %mul.us.us.prol, %47
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  %indvars.iv.next95.prol = or i64 %indvars.iv94.ph, 1
  br label %for.body55.us.us.prol.loopexit.unr-lcssa

for.body55.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.body55.us.us.preheader, %for.body55.us.us.prol
  %indvars.iv94.unr.ph = phi i64 [ %indvars.iv.next95.prol, %for.body55.us.us.prol ], [ %indvars.iv94.ph, %for.body55.us.us.preheader ]
  br label %for.body55.us.us.prol.loopexit

for.body55.us.us.prol.loopexit:                   ; preds = %for.body55.us.us.prol.loopexit.unr-lcssa
  %48 = icmp eq i64 %wide.trip.count96, %indvars.iv94.ph
  br i1 %48, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.body55.us.us.preheader.new

for.body55.us.us.preheader.new:                   ; preds = %for.body55.us.us.prol.loopexit
  br label %for.body55.us.us

min.iters.checked:                                ; preds = %for.cond52.preheader.us.us
  br i1 %cmp.zero, label %for.body55.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep138, %scevgep142143
  %bound1 = icmp ult i8* %scevgep140141, %scevgep139
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bc144 = bitcast double* %arrayidx59.us.us to i8*
  %bound0145 = icmp ult i8* %scevgep138, %bc144
  %bound1146 = icmp ult i8* %bc, %scevgep139
  %found.conflict147 = and i1 %bound0145, %bound1146
  %conflict.rdx = or i1 %found.conflict, %found.conflict147
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %49 = or i64 %index, 1
  %50 = or i64 %index, 2
  %51 = or i64 %index, 3
  %52 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %53 = insertelement <2 x double> undef, double %52, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = insertelement <2 x double> undef, double %52, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv100
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %49, i64 %indvars.iv100
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %50, i64 %indvars.iv100
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %51, i64 %indvars.iv100
  %61 = load double, double* %57, align 8, !alias.scope !6
  %62 = load double, double* %58, align 8, !alias.scope !6
  %63 = load double, double* %59, align 8, !alias.scope !6
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = insertelement <2 x double> undef, double %61, i32 0
  %66 = insertelement <2 x double> %65, double %62, i32 1
  %67 = insertelement <2 x double> undef, double %63, i32 0
  %68 = insertelement <2 x double> %67, double %64, i32 1
  %69 = fmul <2 x double> %54, %66
  %70 = fmul <2 x double> %56, %68
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv98, i64 %index
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !8, !noalias !10
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !8, !noalias !10
  %75 = fadd <2 x double> %69, %wide.load
  %76 = fadd <2 x double> %70, %wide.load149
  %77 = bitcast double* %71 to <2 x double>*
  store <2 x double> %75, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %78 = bitcast double* %73 to <2 x double>*
  store <2 x double> %76, <2 x double>* %78, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %79 = icmp eq i64 %index.next, %n.vec
  br i1 %79, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond52.for.inc72_crit_edge.us.us, label %for.body55.us.us.preheader

for.cond52.for.inc72_crit_edge.us.us.loopexit.unr-lcssa: ; preds = %for.body55.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us.loopexit

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us.prol.loopexit, %for.cond52.for.inc72_crit_edge.us.us.loopexit.unr-lcssa
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %middle.block
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond188 = icmp ne i64 %indvars.iv.next99, %36
  br i1 %exitcond188, label %for.cond52.preheader.us.us, label %for.cond48.for.inc75_crit_edge.us

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.body55.us.us.preheader.new
  %indvars.iv94 = phi i64 [ %indvars.iv94.unr.ph, %for.body55.us.us.preheader.new ], [ %indvars.iv.next95.1, %for.body55.us.us ]
  %80 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 %indvars.iv100
  %81 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %80, %81
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv98, i64 %indvars.iv94
  %82 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %82
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %83 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next95, i64 %indvars.iv100
  %84 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %83, %84
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv98, i64 %indvars.iv.next95
  %85 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %85
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond97.1 = icmp eq i64 %indvars.iv.next95, %wide.trip.count96
  %indvars.iv.next95.1 = add nsw i64 %indvars.iv94, 2
  br i1 %exitcond97.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit.unr-lcssa, label %for.body55.us.us, !llvm.loop !14

for.cond78.preheader:                             ; preds = %for.cond48.for.inc75_crit_edge.us
  %cmp7925 = icmp sgt i32 %n, 0
  br i1 %cmp7925, label %for.cond82.preheader.lr.ph, label %for.end99

for.cond82.preheader.lr.ph:                       ; preds = %for.cond78.preheader
  %86 = add i32 %n, -1
  %wide.trip.count = zext i32 %86 to i64
  %87 = add nuw nsw i64 %wide.trip.count96, 1
  %88 = shl nuw nsw i64 %wide.trip.count96, 3
  %89 = add nuw nsw i64 %88, 8
  %90 = and i64 %87, 8589934588
  %91 = add nsw i64 %90, -4
  %92 = lshr exact i64 %91, 2
  %93 = add nuw nsw i64 %wide.trip.count96, 1
  %min.iters.check153 = icmp ult i64 %87, 4
  %n.vec156 = and i64 %87, 8589934588
  %cmp.zero157 = icmp eq i64 %n.vec156, 0
  %94 = and i64 %92, 1
  %lcmp.mod = icmp eq i64 %94, 0
  %95 = icmp eq i64 %92, 0
  %cmp.n174 = icmp eq i64 %87, %n.vec156
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.lr.ph
  %indvars.iv92 = phi i64 [ 0, %for.cond82.preheader.lr.ph ], [ %indvars.iv.next93, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep159 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 0
  %scevgep159160 = bitcast double* %scevgep159 to i8*
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 %87
  %scevgep161162 = bitcast double* %scevgep161 to i8*
  %96 = mul nuw nsw i64 %indvars.iv92, 16000
  %scevgep163 = getelementptr i8, i8* %call, i64 %96
  %97 = add nuw nsw i64 %89, %96
  %scevgep164 = getelementptr i8, i8* %call, i64 %97
  br i1 %min.iters.check153, label %for.body85.us.preheader, label %min.iters.checked154

min.iters.checked154:                             ; preds = %for.cond82.preheader.us
  br i1 %cmp.zero157, label %for.body85.us.preheader, label %vector.memcheck169

vector.memcheck169:                               ; preds = %min.iters.checked154
  %bound0165 = icmp ult i8* %scevgep159160, %scevgep164
  %bound1166 = icmp ult i8* %scevgep163, %scevgep161162
  %memcheck.conflict168 = and i1 %bound0165, %bound1166
  br i1 %memcheck.conflict168, label %for.body85.us.preheader, label %vector.body150.preheader

vector.body150.preheader:                         ; preds = %vector.memcheck169
  br i1 %lcmp.mod, label %vector.body150.prol.preheader, label %vector.body150.prol.loopexit.unr-lcssa

vector.body150.prol.preheader:                    ; preds = %vector.body150.preheader
  br label %vector.body150.prol

vector.body150.prol:                              ; preds = %vector.body150.prol.preheader
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv92, i64 0
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load179.prol = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !15
  %100 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv92, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load180.prol = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !15
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 0
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load179.prol, <2 x i64>* %103, align 8, !alias.scope !18, !noalias !15
  %104 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load180.prol, <2 x i64>* %105, align 8, !alias.scope !18, !noalias !15
  br label %vector.body150.prol.loopexit.unr-lcssa

vector.body150.prol.loopexit.unr-lcssa:           ; preds = %vector.body150.preheader, %vector.body150.prol
  %index171.unr.ph = phi i64 [ 4, %vector.body150.prol ], [ 0, %vector.body150.preheader ]
  br label %vector.body150.prol.loopexit

vector.body150.prol.loopexit:                     ; preds = %vector.body150.prol.loopexit.unr-lcssa
  br i1 %95, label %middle.block151, label %vector.body150.preheader.new

vector.body150.preheader.new:                     ; preds = %vector.body150.prol.loopexit
  br label %vector.body150

vector.body150:                                   ; preds = %vector.body150, %vector.body150.preheader.new
  %index171 = phi i64 [ %index171.unr.ph, %vector.body150.preheader.new ], [ %index.next172.1, %vector.body150 ]
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv92, i64 %index171
  %107 = bitcast double* %106 to <2 x i64>*
  %wide.load179 = load <2 x i64>, <2 x i64>* %107, align 8, !alias.scope !15
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load180 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !15
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 %index171
  %111 = bitcast double* %110 to <2 x i64>*
  store <2 x i64> %wide.load179, <2 x i64>* %111, align 8, !alias.scope !18, !noalias !15
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load180, <2 x i64>* %113, align 8, !alias.scope !18, !noalias !15
  %index.next172 = add i64 %index171, 4
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv92, i64 %index.next172
  %115 = bitcast double* %114 to <2 x i64>*
  %wide.load179.1 = load <2 x i64>, <2 x i64>* %115, align 8, !alias.scope !15
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load180.1 = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !15
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 %index.next172
  %119 = bitcast double* %118 to <2 x i64>*
  store <2 x i64> %wide.load179.1, <2 x i64>* %119, align 8, !alias.scope !18, !noalias !15
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load180.1, <2 x i64>* %121, align 8, !alias.scope !18, !noalias !15
  %index.next172.1 = add i64 %index171, 8
  %122 = icmp eq i64 %index.next172.1, %n.vec156
  br i1 %122, label %middle.block151.unr-lcssa, label %vector.body150, !llvm.loop !20

middle.block151.unr-lcssa:                        ; preds = %vector.body150
  br label %middle.block151

middle.block151:                                  ; preds = %vector.body150.prol.loopexit, %middle.block151.unr-lcssa
  br i1 %cmp.n174, label %for.cond82.for.inc97_crit_edge.us, label %for.body85.us.preheader

for.body85.us.preheader:                          ; preds = %middle.block151, %vector.memcheck169, %min.iters.checked154, %for.cond82.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck169 ], [ 0, %min.iters.checked154 ], [ 0, %for.cond82.preheader.us ], [ %n.vec156, %middle.block151 ]
  %123 = sub nsw i64 %93, %indvars.iv.ph
  %124 = sub nsw i64 %wide.trip.count96, %indvars.iv.ph
  %xtraiter181 = and i64 %123, 3
  %lcmp.mod182 = icmp eq i64 %xtraiter181, 0
  br i1 %lcmp.mod182, label %for.body85.us.prol.loopexit, label %for.body85.us.prol.preheader

for.body85.us.prol.preheader:                     ; preds = %for.body85.us.preheader
  br label %for.body85.us.prol

for.body85.us.prol:                               ; preds = %for.body85.us.prol, %for.body85.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body85.us.prol ], [ %indvars.iv.ph, %for.body85.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body85.us.prol ], [ %xtraiter181, %for.body85.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv92, i64 %indvars.iv.prol
  %125 = bitcast double* %arrayidx89.us.prol to i64*
  %126 = load i64, i64* %125, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 %indvars.iv.prol
  %127 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %126, i64* %127, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body85.us.prol.loopexit.unr-lcssa, label %for.body85.us.prol, !llvm.loop !21

for.body85.us.prol.loopexit.unr-lcssa:            ; preds = %for.body85.us.prol
  %128 = add i64 %indvars.iv.ph, %xtraiter181
  br label %for.body85.us.prol.loopexit

for.body85.us.prol.loopexit:                      ; preds = %for.body85.us.preheader, %for.body85.us.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body85.us.preheader ], [ %128, %for.body85.us.prol.loopexit.unr-lcssa ]
  %129 = icmp ult i64 %124, 3
  br i1 %129, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.body85.us.preheader.new

for.body85.us.preheader.new:                      ; preds = %for.body85.us.prol.loopexit
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body85.us.preheader.new ], [ %indvars.iv.next.3, %for.body85.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv92, i64 %indvars.iv
  %130 = bitcast double* %arrayidx89.us to i64*
  %131 = load i64, i64* %130, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 %indvars.iv
  %132 = bitcast double* %arrayidx93.us to i64*
  store i64 %131, i64* %132, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next
  %133 = bitcast double* %arrayidx89.us.1 to i64*
  %134 = load i64, i64* %133, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 %indvars.iv.next
  %135 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %134, i64* %135, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %136 = bitcast double* %arrayidx89.us.2 to i64*
  %137 = load i64, i64* %136, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 %indvars.iv.next.1
  %138 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %137, i64* %138, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %139 = bitcast double* %arrayidx89.us.3 to i64*
  %140 = load i64, i64* %139, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 %indvars.iv.next.2
  %141 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %140, i64* %141, align 8
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us.loopexit.unr-lcssa, label %for.body85.us, !llvm.loop !22

for.cond82.for.inc97_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body85.us
  br label %for.cond82.for.inc97_crit_edge.us.loopexit

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us.prol.loopexit, %for.cond82.for.inc97_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %middle.block151
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond = icmp ne i64 %indvars.iv.next93, %36
  br i1 %exitcond, label %for.cond82.preheader.us, label %for.end99.loopexit

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.cond78.preheader, %for.cond44.preheader, %for.end25, %for.end25.thread
  %call129132136 = phi i8* [ %call127, %for.end25.thread ], [ %call, %for.end25 ], [ %call, %for.cond44.preheader ], [ %call, %for.cond78.preheader ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call129132136) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %cmp11 = icmp sgt i32 %n, 0
  br i1 %cmp11, label %for.cond1.preheader.preheader, label %for.end58

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = sext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end47, %for.cond1.preheader.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.end47 ], [ 0, %for.cond1.preheader.preheader ]
  %indvars.iv21 = phi i32 [ %indvars.iv.next22, %for.end47 ], [ -1, %for.cond1.preheader.preheader ]
  %1 = add nuw nsw i64 %indvars.iv30, 4294967295
  %2 = and i64 %1, 4294967295
  %cmp25 = icmp sgt i64 %indvars.iv30, 0
  br i1 %cmp25, label %for.cond4.preheader.preheader, label %for.end47

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 0
  br label %for.cond4.preheader

for.cond28.preheader:                             ; preds = %for.end
  %cmp299 = icmp sgt i64 %indvars.iv30, 0
  br i1 %cmp299, label %for.body30.lr.ph, label %for.end47

for.body30.lr.ph:                                 ; preds = %for.cond28.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv30
  %wide.trip.count23 = zext i32 %indvars.iv21 to i64
  %3 = and i64 %1, 1
  %lcmp.mod29 = icmp eq i64 %3, 0
  br i1 %lcmp.mod29, label %for.body30.prol.preheader, label %for.body30.prol.loopexit.unr-lcssa

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol.preheader
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 0
  %4 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %4, %4
  %5 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %5, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.body30.prol.loopexit.unr-lcssa

for.body30.prol.loopexit.unr-lcssa:               ; preds = %for.body30.lr.ph, %for.body30.prol
  %indvars.iv19.unr.ph = phi i64 [ 1, %for.body30.prol ], [ 0, %for.body30.lr.ph ]
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.unr-lcssa
  %6 = icmp eq i64 %2, 0
  br i1 %6, label %for.end47.loopexit, label %for.body30.lr.ph.new

for.body30.lr.ph.new:                             ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv15 = phi i32 [ %indvars.iv.next16, %for.end ], [ -1, %for.cond4.preheader.preheader ]
  %7 = add nuw nsw i64 %indvars.iv17, 4294967295
  %8 = and i64 %7, 4294967295
  %cmp54 = icmp sgt i64 %indvars.iv17, 0
  br i1 %cmp54, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv17
  %wide.trip.count = zext i32 %indvars.iv15 to i64
  %9 = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %for.body6.prol.preheader, label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  br label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.prol.preheader
  %10 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv17, i64 0
  %11 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %10, %11
  %12 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %12, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  %13 = icmp eq i64 %8, 0
  br i1 %13, label %for.end.loopexit, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv
  %14 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv
  %15 = load double, double* %arrayidx12, align 8
  %mul = fmul double %14, %15
  %16 = load double, double* %arrayidx16, align 8
  %sub = fsub double %16, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next
  %17 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %17, %18
  %19 = load double, double* %arrayidx16, align 8
  %sub.1 = fsub double %19, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body6

for.end.loopexit.unr-lcssa:                       ; preds = %for.body6
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body6.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond4.preheader
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv17
  %20 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv17
  %21 = load double, double* %arrayidx24, align 8
  %div = fdiv double %21, %20
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %indvars.iv.next16 = add nsw i32 %indvars.iv15, 1
  %exitcond = icmp ne i64 %indvars.iv.next18, %indvars.iv30
  br i1 %exitcond, label %for.cond4.preheader, label %for.cond28.preheader

for.body30:                                       ; preds = %for.body30, %for.body30.lr.ph.new
  %indvars.iv19 = phi i64 [ %indvars.iv19.unr.ph, %for.body30.lr.ph.new ], [ %indvars.iv.next20.1, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv19
  %22 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %22, %22
  %23 = load double, double* %arrayidx43, align 8
  %sub44 = fsub double %23, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next20
  %24 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %24, %24
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next20, %wide.trip.count23
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  br i1 %exitcond24.1, label %for.end47.loopexit.unr-lcssa, label %for.body30

for.end47.loopexit.unr-lcssa:                     ; preds = %for.body30
  br label %for.end47.loopexit

for.end47.loopexit:                               ; preds = %for.body30.prol.loopexit, %for.end47.loopexit.unr-lcssa
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %for.cond28.preheader, %for.cond1.preheader
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv30
  %25 = load double, double* %arrayidx51, align 8
  %call = tail call double @sqrt(double %25) #3
  store double %call, double* %arrayidx51, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %indvars.iv.next22 = add nsw i32 %indvars.iv21, 1
  %exitcond32 = icmp ne i64 %indvars.iv.next31, %0
  br i1 %exitcond32, label %for.cond1.preheader, label %for.end58.loopexit

for.end58.loopexit:                               ; preds = %for.end47
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
  br i1 %cmp4, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = sext i32 %n to i64
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.inc10 ], [ 1, %for.cond2.preheader.preheader ]
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next10, %for.inc10 ]
  %5 = mul nsw i64 %indvars.iv9, %3
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body4.lr.ph ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv9, i64 %indvars.iv
  %10 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %indvars.iv12
  br i1 %exitcond, label %for.body4, label %for.inc10

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp ne i64 %indvars.iv.next10, %4
  br i1 %exitcond14, label %for.body4.lr.ph, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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
