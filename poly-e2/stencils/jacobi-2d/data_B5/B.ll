; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1300 x double]*
  tail call fastcc void @init_array([1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d([1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
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
  tail call fastcc void @print_array([1300 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc20, %entry
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.inc20 ]
  %0 = trunc i64 %indvars.iv14 to i32
  %conv = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %mul.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %2 = add nuw nsw i64 %indvars.iv, 2
  %3 = trunc i64 %2 to i32
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  %4 = add nuw nsw i64 %indvars.iv, 3
  %5 = trunc i64 %4 to i32
  %conv11 = sitofp i32 %5 to double
  %mul.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %conv11, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, %mul.v.i1.2
  %add5 = fadd <2 x double> %mul, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add5, <double 1.300000e+03, double 1.300000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx8, align 8
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv14, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.inc20, label %for.body3

for.inc20:                                        ; preds = %for.body3
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1300
  br i1 %exitcond16, label %for.end22, label %for.cond1.preheader

for.end22:                                        ; preds = %for.inc20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d([1300 x double]* %A, [1300 x double]* %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %entry
  %storemerge52 = phi i32 [ 0, %entry ], [ %inc88, %for.inc87 ]
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.for.inc37_crit_edge.us, %for.cond1.preheader
  %indvar89 = phi i64 [ %0, %for.cond4.for.inc37_crit_edge.us ], [ 0, %for.cond1.preheader ]
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond4.for.inc37_crit_edge.us ], [ 1, %for.cond1.preheader ]
  %0 = add i64 %indvar89, 1
  %scevgep91 = getelementptr [1300 x double], [1300 x double]* %B, i64 %0, i64 1
  %scevgep93 = getelementptr [1300 x double], [1300 x double]* %B, i64 %0, i64 1299
  %scevgep95 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar89, i64 1
  %1 = add i64 %indvar89, 2
  %scevgep97 = getelementptr [1300 x double], [1300 x double]* %A, i64 %1, i64 1299
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %2 = add nsw i64 %indvars.iv54, -1
  %bound099 = icmp ult double* %scevgep91, %scevgep97
  %bound1100 = icmp ult double* %scevgep95, %scevgep93
  %memcheck.conflict102 = and i1 %bound099, %bound1100
  br i1 %memcheck.conflict102, label %for.body7.us.preheader, label %vector.body84.preheader

vector.body84.preheader:                          ; preds = %for.cond4.preheader.us
  br label %vector.body84

vector.body84:                                    ; preds = %vector.body84.preheader, %vector.body84
  %index105 = phi i64 [ %index.next106, %vector.body84 ], [ 0, %vector.body84.preheader ]
  %offset.idx109 = or i64 %index105, 1
  %3 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv54, i64 %offset.idx109
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1
  %5 = getelementptr double, double* %3, i64 2
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load115 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = add nsw i64 %offset.idx109, -1
  %8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv54, i64 %7
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load116 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fadd <2 x double> %wide.load114, %wide.load116
  %13 = fadd <2 x double> %wide.load115, %wide.load117
  %14 = add nuw nsw i64 %offset.idx109, 1
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv54, i64 %14
  %16 = getelementptr double, double* %15, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %12, %wide.load117
  %19 = fadd <2 x double> %13, %wide.load119
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next55, i64 %offset.idx109
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %18, %wide.load120
  %25 = fadd <2 x double> %19, %wide.load121
  %26 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %2, i64 %offset.idx109
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %24, %wide.load122
  %31 = fadd <2 x double> %25, %wide.load123
  %32 = fmul <2 x double> %30, <double 2.000000e-01, double 2.000000e-01>
  %33 = fmul <2 x double> %31, <double 2.000000e-01, double 2.000000e-01>
  %34 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv54, i64 %offset.idx109
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %32, <2 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> %33, <2 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %index.next106 = add i64 %index105, 4
  %38 = icmp eq i64 %index.next106, 1296
  br i1 %38, label %for.body7.us.preheader.loopexit, label %vector.body84, !llvm.loop !6

for.body7.us.preheader.loopexit:                  ; preds = %vector.body84
  br label %for.body7.us.preheader

for.body7.us.preheader:                           ; preds = %for.body7.us.preheader.loopexit, %for.cond4.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %for.cond4.preheader.us ], [ 1297, %for.body7.us.preheader.loopexit ]
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us.preheader, %for.body7.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7.us ], [ %indvars.iv.ph, %for.body7.us.preheader ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv
  %39 = load double, double* %arrayidx9.us, align 8
  %40 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv54, i64 %40
  %41 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %39, %41
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv.next
  %42 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %42
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next55, i64 %indvars.iv
  %43 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %43
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %2, i64 %indvars.iv
  %44 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %44
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %for.cond4.for.inc37_crit_edge.us, label %for.body7.us, !llvm.loop !9

for.cond4.for.inc37_crit_edge.us:                 ; preds = %for.body7.us
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 1299
  br i1 %exitcond57, label %for.cond44.preheader.us.preheader, label %for.cond4.preheader.us

for.cond44.preheader.us.preheader:                ; preds = %for.cond4.for.inc37_crit_edge.us
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.preheader.us.preheader, %for.cond44.for.inc84_crit_edge.us
  %indvar = phi i64 [ %45, %for.cond44.for.inc84_crit_edge.us ], [ 0, %for.cond44.preheader.us.preheader ]
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.cond44.for.inc84_crit_edge.us ], [ 1, %for.cond44.preheader.us.preheader ]
  %45 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %45, i64 1
  %scevgep68 = getelementptr [1300 x double], [1300 x double]* %A, i64 %45, i64 1299
  %scevgep70 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %46 = add i64 %indvar, 2
  %scevgep72 = getelementptr [1300 x double], [1300 x double]* %B, i64 %46, i64 1299
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %47 = add nsw i64 %indvars.iv62, -1
  %bound0 = icmp ult double* %scevgep, %scevgep72
  %bound1 = icmp ult double* %scevgep70, %scevgep68
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond44.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %48 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv62, i64 %offset.idx
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !10
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = add nsw i64 %offset.idx, -1
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv62, i64 %52
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fadd <2 x double> %wide.load, %wide.load76
  %58 = fadd <2 x double> %wide.load75, %wide.load77
  %59 = add nuw nsw i64 %offset.idx, 1
  %60 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv62, i64 %59
  %61 = getelementptr double, double* %60, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = fadd <2 x double> %57, %wide.load77
  %64 = fadd <2 x double> %58, %wide.load79
  %65 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next63, i64 %offset.idx
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = fadd <2 x double> %63, %wide.load80
  %70 = fadd <2 x double> %64, %wide.load81
  %71 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %47, i64 %offset.idx
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = fadd <2 x double> %69, %wide.load82
  %76 = fadd <2 x double> %70, %wide.load83
  %77 = fmul <2 x double> %75, <double 2.000000e-01, double 2.000000e-01>
  %78 = fmul <2 x double> %76, <double 2.000000e-01, double 2.000000e-01>
  %79 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv62, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %77, <2 x double>* %80, align 8, !alias.scope !13, !noalias !10
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %78, <2 x double>* %82, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, 1296
  br i1 %83, label %for.body47.us.preheader.loopexit, label %vector.body, !llvm.loop !15

for.body47.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.body47.us.preheader

for.body47.us.preheader:                          ; preds = %for.body47.us.preheader.loopexit, %for.cond44.preheader.us
  %indvars.iv58.ph = phi i64 [ 1, %for.cond44.preheader.us ], [ 1297, %for.body47.us.preheader.loopexit ]
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.body47.us.preheader, %for.body47.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.body47.us ], [ %indvars.iv58.ph, %for.body47.us.preheader ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv62, i64 %indvars.iv58
  %84 = load double, double* %arrayidx51.us, align 8
  %85 = add nsw i64 %indvars.iv58, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv62, i64 %85
  %86 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %84, %86
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv62, i64 %indvars.iv.next59
  %87 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %87
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next63, i64 %indvars.iv58
  %88 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %88
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %47, i64 %indvars.iv58
  %89 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %89
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv58
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 1299
  br i1 %exitcond61, label %for.cond44.for.inc84_crit_edge.us, label %for.body47.us, !llvm.loop !16

for.cond44.for.inc84_crit_edge.us:                ; preds = %for.body47.us
  %exitcond65 = icmp eq i64 %indvars.iv.next63, 1299
  br i1 %exitcond65, label %for.inc87, label %for.cond44.preheader.us

for.inc87:                                        ; preds = %for.cond44.for.inc84_crit_edge.us
  %inc88 = add nuw nsw i32 %storemerge52, 1
  %exitcond66 = icmp eq i32 %inc88, 500
  br i1 %exitcond66, label %for.end89, label %for.cond1.preheader

for.end89:                                        ; preds = %for.inc87
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1300 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv10, 1300
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

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1300
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader

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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
