; ModuleID = 'B.ll'
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
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array([1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
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
  %indvars.iv39 = phi i64 [ 0, %entry ], [ %indvars.iv.next40, %for.inc17 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.body3 ], [ 0, %for.cond1.preheader ]
  %0 = mul nuw nsw i64 %indvars.iv33, %indvars.iv39
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.200000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv33
  store double %div, double* %arrayidx6, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9 = srem i32 %4, 1000
  %conv10 = sitofp i32 %rem9 to double
  %div12 = fdiv double %conv10, 1.000000e+03
  %arrayidx16 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv39, i64 %indvars.iv33
  store double %div12, double* %arrayidx16, align 8
  %exitcond38 = icmp eq i64 %indvars.iv33, 999
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  br i1 %exitcond38, label %for.inc17, label %for.body3

for.inc17:                                        ; preds = %for.body3
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond2, label %for.cond24.preheader.preheader, label %for.cond1.preheader

for.cond24.preheader.preheader:                   ; preds = %for.inc17
  br label %for.cond24.preheader

for.cond24.preheader:                             ; preds = %for.inc41, %for.cond24.preheader.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc41 ], [ 0, %for.cond24.preheader.preheader ]
  br label %for.body27

for.body27:                                       ; preds = %for.body27, %for.cond24.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body27 ], [ 0, %for.cond24.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv31
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30 = srem i32 %7, 1200
  %conv31 = sitofp i32 %rem30 to double
  %div33 = fdiv double %conv31, 1.000000e+03
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv
  store double %div33, double* %arrayidx37, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.inc41, label %for.body27

for.inc41:                                        ; preds = %for.body27
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond1, label %for.end43, label %for.cond24.preheader

for.end43:                                        ; preds = %for.inc41
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert26 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat27 = shufflevector <2 x double> %broadcast.splatinsert26, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.inc43, %entry
  %indvars.iv41 = phi i64 [ 0, %entry ], [ %indvars.iv.next42, %for.inc43 ]
  %0 = add nsw i64 %indvars.iv41, -3
  %1 = lshr i64 %0, 2
  %2 = add nuw nsw i64 %indvars.iv41, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 0
  %3 = mul nuw nsw i64 %indvars.iv41, 1201
  %4 = add nuw nsw i64 %3, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %4
  %5 = add nuw nsw i64 %indvars.iv41, 1
  %min.iters.check31 = icmp ult i64 %2, 4
  br i1 %min.iters.check31, label %for.body3.preheader, label %min.iters.checked32

min.iters.checked32:                              ; preds = %for.body3.lr.ph
  %n.vec34 = and i64 %2, -4
  %cmp.zero35 = icmp eq i64 %n.vec34, 0
  br i1 %cmp.zero35, label %for.body3.preheader, label %vector.ph36

vector.ph36:                                      ; preds = %min.iters.checked32
  %6 = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %6, 0
  br i1 %lcmp.mod, label %vector.body28.prol.preheader, label %vector.body28.prol.loopexit.unr-lcssa

vector.body28.prol.preheader:                     ; preds = %vector.ph36
  br label %vector.body28.prol

vector.body28.prol:                               ; preds = %vector.body28.prol.preheader
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 0
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load45.prol = load <2 x double>, <2 x double>* %8, align 8
  %9 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load46.prol = load <2 x double>, <2 x double>* %10, align 8
  %11 = fmul <2 x double> %wide.load45.prol, %broadcast.splat48
  %12 = fmul <2 x double> %wide.load46.prol, %broadcast.splat48
  %13 = bitcast double* %7 to <2 x double>*
  store <2 x double> %11, <2 x double>* %13, align 8
  %14 = bitcast double* %9 to <2 x double>*
  store <2 x double> %12, <2 x double>* %14, align 8
  br label %vector.body28.prol.loopexit.unr-lcssa

vector.body28.prol.loopexit.unr-lcssa:            ; preds = %vector.body28.prol, %vector.ph36
  %index37.unr.ph = phi i64 [ 4, %vector.body28.prol ], [ 0, %vector.ph36 ]
  br label %vector.body28.prol.loopexit

vector.body28.prol.loopexit:                      ; preds = %vector.body28.prol.loopexit.unr-lcssa
  %15 = icmp eq i64 %1, 0
  br i1 %15, label %middle.block29, label %vector.ph36.new

vector.ph36.new:                                  ; preds = %vector.body28.prol.loopexit
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28, %vector.ph36.new
  %index37 = phi i64 [ %index37.unr.ph, %vector.ph36.new ], [ %index.next38.1, %vector.body28 ]
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 %index37
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %19, align 8
  %20 = fmul <2 x double> %wide.load45, %broadcast.splat48
  %21 = fmul <2 x double> %wide.load46, %broadcast.splat48
  %22 = bitcast double* %16 to <2 x double>*
  store <2 x double> %20, <2 x double>* %22, align 8
  %23 = bitcast double* %18 to <2 x double>*
  store <2 x double> %21, <2 x double>* %23, align 8
  %index.next38 = add i64 %index37, 4
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 %index.next38
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load45.1 = load <2 x double>, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load46.1 = load <2 x double>, <2 x double>* %27, align 8
  %28 = fmul <2 x double> %wide.load45.1, %broadcast.splat48
  %29 = fmul <2 x double> %wide.load46.1, %broadcast.splat48
  %30 = bitcast double* %24 to <2 x double>*
  store <2 x double> %28, <2 x double>* %30, align 8
  %31 = bitcast double* %26 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8
  %index.next38.1 = add i64 %index37, 8
  %32 = icmp eq i64 %index.next38.1, %n.vec34
  br i1 %32, label %middle.block29.unr-lcssa, label %vector.body28, !llvm.loop !1

middle.block29.unr-lcssa:                         ; preds = %vector.body28
  br label %middle.block29

middle.block29:                                   ; preds = %middle.block29.unr-lcssa, %vector.body28.prol.loopexit
  %cmp.n40 = icmp eq i64 %2, %n.vec34
  br i1 %cmp.n40, label %for.cond9.preheader.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block29, %min.iters.checked32, %for.body3.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked32 ], [ 0, %for.body3.lr.ph ], [ %n.vec34, %middle.block29 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 %indvars.iv
  %33 = load double, double* %arrayidx5, align 8
  %mul = fmul double %33, %beta
  store double %mul, double* %arrayidx5, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv41
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond9.preheader.preheader.loopexit, label %for.body3, !llvm.loop !4

for.cond9.preheader.preheader.loopexit:           ; preds = %for.body3
  br label %for.cond9.preheader.preheader

for.cond9.preheader.preheader:                    ; preds = %for.cond9.preheader.preheader.loopexit, %middle.block29
  %min.iters.check = icmp ult i64 %5, 2
  %n.vec = and i64 %5, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %5, %n.vec
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.inc40, %for.cond9.preheader.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.inc40 ], [ 0, %for.cond9.preheader.preheader ]
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv38
  %34 = add nuw nsw i64 %indvars.iv38, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv41, i64 %34
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv38
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv41, i64 %34
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv41, i64 %indvars.iv38
  %arrayidx30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv38
  br i1 %min.iters.check, label %for.body11.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader
  br i1 %cmp.zero, label %for.body11.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30
  %bound1 = icmp ult double* %arrayidx30, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep6
  %bound114 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ult double* %scevgep, %scevgep10
  %bound117 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound022 = icmp ult double* %scevgep, %arrayidx20
  %bound123 = icmp ult double* %arrayidx20, %scevgep2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx19, %found.conflict24
  br i1 %conflict.rdx25, label %for.body11.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %35 = or i64 %index, 1
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv38
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %35, i64 %indvars.iv38
  %38 = load double, double* %36, align 8, !alias.scope !6
  %39 = load double, double* %37, align 8, !alias.scope !6
  %40 = insertelement <2 x double> undef, double %38, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fmul <2 x double> %41, %broadcast.splat27
  %43 = load double, double* %arrayidx20, align 8, !alias.scope !9
  %44 = insertelement <2 x double> undef, double %43, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = fmul <2 x double> %42, %45
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv38
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %35, i64 %indvars.iv38
  %49 = load double, double* %47, align 8, !alias.scope !11
  %50 = load double, double* %48, align 8, !alias.scope !11
  %51 = insertelement <2 x double> undef, double %49, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %52, %broadcast.splat27
  %54 = load double, double* %arrayidx30, align 8, !alias.scope !13
  %55 = insertelement <2 x double> undef, double %54, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  %57 = fmul <2 x double> %53, %56
  %58 = fadd <2 x double> %46, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 %index
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !15, !noalias !17
  %61 = fadd <2 x double> %wide.load, %58
  %62 = bitcast double* %59 to <2 x double>*
  store <2 x double> %61, <2 x double>* %62, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %63 = icmp eq i64 %index.next, %n.vec
  br i1 %63, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc40, label %for.body11.preheader

for.body11.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader
  %indvars.iv32.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader ], [ %n.vec, %middle.block ]
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.body11.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %for.body11 ], [ %indvars.iv32.ph, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv38
  %64 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %64, %alpha
  %65 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %65
  %arrayidx25 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv32, i64 %indvars.iv38
  %66 = load double, double* %arrayidx25, align 8
  %mul26 = fmul double %66, %alpha
  %67 = load double, double* %arrayidx30, align 8
  %mul31 = fmul double %mul26, %67
  %add = fadd double %mul21, %mul31
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 %indvars.iv32
  %68 = load double, double* %arrayidx35, align 8
  %add36 = fadd double %68, %add
  store double %add36, double* %arrayidx35, align 8
  %exitcond37 = icmp eq i64 %indvars.iv32, %indvars.iv41
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  br i1 %exitcond37, label %for.inc40.loopexit, label %for.body11, !llvm.loop !19

for.inc40.loopexit:                               ; preds = %for.body11
  br label %for.inc40

for.inc40:                                        ; preds = %for.inc40.loopexit, %middle.block
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond49, label %for.inc43, label %for.cond9.preheader

for.inc43:                                        ; preds = %for.inc40
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond50, label %for.end45, label %for.body3.lr.ph

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv11, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

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
