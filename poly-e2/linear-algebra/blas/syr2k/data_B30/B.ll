; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay1 = bitcast i8* %call to [1200 x double]*
  %arraydecay32 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay43 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay1, [1000 x double]* %arraydecay32, [1000 x double]* %arraydecay43)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syr2k(double %0, double %1, [1200 x double]* %arraydecay1, [1000 x double]* %arraydecay32, [1000 x double]* %arraydecay43)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc17, %entry
  %indvars.iv15 = phi i64 [ 0, %entry ], [ %indvars.iv.next16, %for.inc17 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next10, %for.inc ]
  %0 = mul nuw nsw i64 %indvars.iv9, %indvars.iv15
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv9
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9 = srem i32 %4, 1000
  %conv10 = sitofp i32 %rem9 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv10, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.200000e+03, double 1.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx6, align 8
  %arrayidx16 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv15, i64 %indvars.iv9
  store double %div.v.r2, double* %arrayidx16, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond14 = icmp eq i64 %indvars.iv9, 999
  br i1 %exitcond14, label %for.inc17, label %for.inc

for.inc17:                                        ; preds = %for.inc
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond2, label %for.cond24.preheader.preheader, label %for.cond1.preheader

for.cond24.preheader.preheader:                   ; preds = %for.inc17
  br label %for.cond24.preheader

for.cond24.preheader:                             ; preds = %for.cond24.preheader.preheader, %for.inc41
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc41 ], [ 0, %for.cond24.preheader.preheader ]
  br label %for.inc38

for.inc38:                                        ; preds = %for.inc38, %for.cond24.preheader
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.inc38 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30 = srem i32 %7, 1200
  %conv31 = sitofp i32 %rem30 to double
  %div33 = fdiv double %conv31, 1.000000e+03
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  store double %div33, double* %arrayidx37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %for.inc41, label %for.inc38

for.inc41:                                        ; preds = %for.inc38
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond1, label %for.end43, label %for.cond24.preheader

for.end43:                                        ; preds = %for.inc41
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert28 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat29 = shufflevector <2 x double> %broadcast.splatinsert28, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert49 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat50 = shufflevector <2 x double> %broadcast.splatinsert49, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc43, %entry
  %indvars.iv20 = phi i64 [ 0, %entry ], [ %indvars.iv.next21, %for.inc43 ]
  %0 = add i64 %indvars.iv20, -3
  %1 = lshr i64 %0, 2
  %2 = add i64 %indvars.iv20, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 0
  %3 = mul i64 %indvars.iv20, 1201
  %4 = add i64 %3, 1
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %4
  %5 = add i64 %indvars.iv20, 1
  %min.iters.check33 = icmp ult i64 %2, 4
  br i1 %min.iters.check33, label %for.inc.preheader, label %min.iters.checked34

min.iters.checked34:                              ; preds = %for.inc.lr.ph
  %n.vec36 = and i64 %2, -4
  %cmp.zero37 = icmp eq i64 %n.vec36, 0
  br i1 %cmp.zero37, label %for.inc.preheader, label %vector.ph38

vector.ph38:                                      ; preds = %min.iters.checked34
  %6 = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %6, 0
  br i1 %lcmp.mod, label %vector.body30.prol.preheader, label %vector.body30.prol.loopexit.unr-lcssa

vector.body30.prol.preheader:                     ; preds = %vector.ph38
  br label %vector.body30.prol

vector.body30.prol:                               ; preds = %vector.body30.prol.preheader
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 0
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load47.prol = load <2 x double>, <2 x double>* %8, align 8
  %9 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load48.prol = load <2 x double>, <2 x double>* %10, align 8
  %11 = fmul <2 x double> %wide.load47.prol, %broadcast.splat50
  %12 = fmul <2 x double> %wide.load48.prol, %broadcast.splat50
  %13 = bitcast double* %7 to <2 x double>*
  store <2 x double> %11, <2 x double>* %13, align 8
  %14 = bitcast double* %9 to <2 x double>*
  store <2 x double> %12, <2 x double>* %14, align 8
  br label %vector.body30.prol.loopexit.unr-lcssa

vector.body30.prol.loopexit.unr-lcssa:            ; preds = %vector.ph38, %vector.body30.prol
  %index39.unr.ph = phi i64 [ 4, %vector.body30.prol ], [ 0, %vector.ph38 ]
  br label %vector.body30.prol.loopexit

vector.body30.prol.loopexit:                      ; preds = %vector.body30.prol.loopexit.unr-lcssa
  %15 = icmp eq i64 %1, 0
  br i1 %15, label %middle.block31, label %vector.ph38.new

vector.ph38.new:                                  ; preds = %vector.body30.prol.loopexit
  br label %vector.body30

vector.body30:                                    ; preds = %vector.body30, %vector.ph38.new
  %index39 = phi i64 [ %index39.unr.ph, %vector.ph38.new ], [ %index.next40.1, %vector.body30 ]
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %index39
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %19, align 8
  %20 = fmul <2 x double> %wide.load47, %broadcast.splat50
  %21 = fmul <2 x double> %wide.load48, %broadcast.splat50
  %22 = bitcast double* %16 to <2 x double>*
  store <2 x double> %20, <2 x double>* %22, align 8
  %23 = bitcast double* %18 to <2 x double>*
  store <2 x double> %21, <2 x double>* %23, align 8
  %index.next40 = add i64 %index39, 4
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %index.next40
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load47.1 = load <2 x double>, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load48.1 = load <2 x double>, <2 x double>* %27, align 8
  %28 = fmul <2 x double> %wide.load47.1, %broadcast.splat50
  %29 = fmul <2 x double> %wide.load48.1, %broadcast.splat50
  %30 = bitcast double* %24 to <2 x double>*
  store <2 x double> %28, <2 x double>* %30, align 8
  %31 = bitcast double* %26 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8
  %index.next40.1 = add i64 %index39, 8
  %32 = icmp eq i64 %index.next40.1, %n.vec36
  br i1 %32, label %middle.block31.unr-lcssa, label %vector.body30, !llvm.loop !1

middle.block31.unr-lcssa:                         ; preds = %vector.body30
  br label %middle.block31

middle.block31:                                   ; preds = %vector.body30.prol.loopexit, %middle.block31.unr-lcssa
  %cmp.n42 = icmp eq i64 %2, %n.vec36
  br i1 %cmp.n42, label %for.cond9.preheader.preheader, label %for.inc.preheader

for.inc.preheader:                                ; preds = %middle.block31, %min.iters.checked34, %for.inc.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked34 ], [ 0, %for.inc.lr.ph ], [ %n.vec36, %middle.block31 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %indvars.iv.ph, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %indvars.iv
  %33 = load double, double* %arrayidx5, align 8
  %mul = fmul double %33, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv20
  br i1 %exitcond, label %for.cond9.preheader.preheader.loopexit, label %for.inc, !llvm.loop !4

for.cond9.preheader.preheader.loopexit:           ; preds = %for.inc
  br label %for.cond9.preheader.preheader

for.cond9.preheader.preheader:                    ; preds = %for.cond9.preheader.preheader.loopexit, %middle.block31
  %min.iters.check = icmp ult i64 %5, 2
  %n.vec = and i64 %5, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %5, %n.vec
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.preheader, %for.inc40
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc40 ], [ 0, %for.cond9.preheader.preheader ]
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv17
  %34 = add i64 %indvars.iv17, 1
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %34
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv17
  %scevgep12 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv20, i64 %34
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv20, i64 %indvars.iv17
  %arrayidx30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv17
  br i1 %min.iters.check, label %for.inc37.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader
  br i1 %cmp.zero, label %for.inc37.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30
  %bound1 = icmp ult double* %arrayidx30, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound015 = icmp ult double* %scevgep, %scevgep8
  %bound116 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict17 = and i1 %bound015, %bound116
  %conflict.rdx = or i1 %found.conflict, %found.conflict17
  %bound018 = icmp ult double* %scevgep, %scevgep12
  %bound119 = icmp ult double* %scevgep10, %scevgep4
  %found.conflict20 = and i1 %bound018, %bound119
  %conflict.rdx21 = or i1 %conflict.rdx, %found.conflict20
  %bound024 = icmp ult double* %scevgep, %arrayidx20
  %bound125 = icmp ult double* %arrayidx20, %scevgep4
  %found.conflict26 = and i1 %bound024, %bound125
  %conflict.rdx27 = or i1 %conflict.rdx21, %found.conflict26
  br i1 %conflict.rdx27, label %for.inc37.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %35 = or i64 %index, 1
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv17
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %35, i64 %indvars.iv17
  %38 = load double, double* %36, align 8, !alias.scope !6
  %39 = load double, double* %37, align 8, !alias.scope !6
  %40 = insertelement <2 x double> undef, double %38, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fmul <2 x double> %41, %broadcast.splat29
  %43 = load double, double* %arrayidx20, align 8, !alias.scope !9
  %44 = insertelement <2 x double> undef, double %43, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = fmul <2 x double> %42, %45
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv17
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %35, i64 %indvars.iv17
  %49 = load double, double* %47, align 8, !alias.scope !11
  %50 = load double, double* %48, align 8, !alias.scope !11
  %51 = insertelement <2 x double> undef, double %49, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %52, %broadcast.splat29
  %54 = load double, double* %arrayidx30, align 8, !alias.scope !13
  %55 = insertelement <2 x double> undef, double %54, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  %57 = fmul <2 x double> %53, %56
  %58 = fadd <2 x double> %46, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %index
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !15, !noalias !17
  %61 = fadd <2 x double> %wide.load, %58
  %62 = bitcast double* %59 to <2 x double>*
  store <2 x double> %61, <2 x double>* %62, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %63 = icmp eq i64 %index.next, %n.vec
  br i1 %63, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc40, label %for.inc37.preheader

for.inc37.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader
  %indvars.iv11.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader ], [ %n.vec, %middle.block ]
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.preheader, %for.inc37
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.inc37 ], [ %indvars.iv11.ph, %for.inc37.preheader ]
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv17
  %64 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %64, %alpha
  %65 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %65
  %arrayidx25 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv11, i64 %indvars.iv17
  %66 = load double, double* %arrayidx25, align 8
  %mul26 = fmul double %66, %alpha
  %67 = load double, double* %arrayidx30, align 8
  %mul31 = fmul double %mul26, %67
  %add = fadd double %mul21, %mul31
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %indvars.iv11
  %68 = load double, double* %arrayidx35, align 8
  %add36 = fadd double %68, %add
  store double %add36, double* %arrayidx35, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond16 = icmp eq i64 %indvars.iv11, %indvars.iv20
  br i1 %exitcond16, label %for.inc40.loopexit, label %for.inc37, !llvm.loop !19

for.inc40.loopexit:                               ; preds = %for.inc37
  br label %for.inc40

for.inc40:                                        ; preds = %for.inc40.loopexit, %middle.block
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond1, label %for.inc43, label %for.cond9.preheader

for.inc43:                                        ; preds = %for.inc40
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond2, label %for.end45, label %for.inc.lr.ph

for.end45:                                        ; preds = %for.inc43
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv4, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!14, !7, !12, !10}
!18 = distinct !{!18, !2, !3}
!19 = distinct !{!19, !2, !3}
