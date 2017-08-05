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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %.cast = bitcast i8* %call to [1300 x double]*
  %.cast7 = bitcast i8* %call1 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %.cast, [1300 x double]* %.cast7)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %.cast, [1300 x double]* %.cast7)
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
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %.cast)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [1300 x double]* %A, [1300 x double]* %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %entry
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.cond1.for.inc20_crit_edge.us ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv15 to i32
  %conv.us = sitofp i32 %0 to double
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %1 = add nuw nsw i64 %indvars.iv, 2
  %2 = trunc i64 %1 to i32
  %conv4.us = sitofp i32 %2 to double
  %mul.us = fmul double %conv.us, %conv4.us
  %add5.us = fadd double %mul.us, 2.000000e+00
  %div.us = fdiv double %add5.us, 1.300000e+03
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  store double %div.us, double* %arrayidx8.us, align 8
  %3 = add nuw nsw i64 %indvars.iv, 3
  %4 = trunc i64 %3 to i32
  %conv11.us = sitofp i32 %4 to double
  %mul12.us = fmul double %conv.us, %conv11.us
  %add13.us = fadd double %mul12.us, 3.000000e+00
  %div15.us = fdiv double %add13.us, 1.300000e+03
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv15, i64 %indvars.iv
  store double %div15.us, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.cond1.for.inc20_crit_edge.us, label %for.inc.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1300
  br i1 %exitcond18, label %for.end22, label %for.cond1.preheader.us

for.end22:                                        ; preds = %for.cond1.for.inc20_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* %A, [1300 x double]* %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %entry
  %storemerge51 = phi i32 [ 0, %entry ], [ %inc88, %for.inc87 ]
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond1.preheader, %for.cond4.for.inc37_crit_edge.us
  %indvar91 = phi i64 [ 0, %for.cond1.preheader ], [ %indvar.next92, %for.cond4.for.inc37_crit_edge.us ]
  %indvars.iv52 = phi i64 [ 1, %for.cond1.preheader ], [ %add21.us, %for.cond4.for.inc37_crit_edge.us ]
  %0 = add i64 %indvar91, 1
  %scevgep93 = getelementptr [1300 x double], [1300 x double]* %B, i64 %0, i64 1
  %scevgep95 = getelementptr [1300 x double], [1300 x double]* %B, i64 %0, i64 1299
  %scevgep97 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar91, i64 1
  %1 = add i64 %indvar91, 2
  %scevgep99 = getelementptr [1300 x double], [1300 x double]* %A, i64 %1, i64 1299
  %add21.us = add nuw nsw i64 %indvars.iv52, 1
  %sub27.us = add nsw i64 %indvars.iv52, -1
  %bound0101 = icmp ult double* %scevgep93, %scevgep99
  %bound1102 = icmp ult double* %scevgep97, %scevgep95
  %memcheck.conflict104 = and i1 %bound0101, %bound1102
  br i1 %memcheck.conflict104, label %for.inc.us.preheader, label %vector.body82.preheader

vector.body82.preheader:                          ; preds = %for.cond4.preheader.us
  br label %vector.body82

vector.body82:                                    ; preds = %vector.body82.preheader, %vector.body82
  %index107 = phi i64 [ %index.next108, %vector.body82 ], [ 0, %vector.body82.preheader ]
  %offset.idx112 = or i64 %index107, 1
  %2 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv52, i64 %offset.idx112
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %3, align 8, !alias.scope !1
  %4 = getelementptr double, double* %2, i64 2
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = add nsw i64 %offset.idx112, -1
  %7 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv52, i64 %6
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = fadd <2 x double> %wide.load117, %wide.load119
  %12 = fadd <2 x double> %wide.load118, %wide.load120
  %13 = add nuw nsw i64 %offset.idx112, 1
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv52, i64 %13
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %11, %wide.load121
  %19 = fadd <2 x double> %12, %wide.load122
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %add21.us, i64 %offset.idx112
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %18, %wide.load123
  %25 = fadd <2 x double> %19, %wide.load124
  %26 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %sub27.us, i64 %offset.idx112
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %24, %wide.load125
  %31 = fadd <2 x double> %25, %wide.load126
  %32 = fmul <2 x double> %30, <double 2.000000e-01, double 2.000000e-01>
  %33 = fmul <2 x double> %31, <double 2.000000e-01, double 2.000000e-01>
  %34 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv52, i64 %offset.idx112
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %32, <2 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> %33, <2 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %index.next108 = add i64 %index107, 4
  %38 = icmp eq i64 %index.next108, 1296
  br i1 %38, label %for.inc.us.preheader.loopexit, label %vector.body82, !llvm.loop !6

for.inc.us.preheader.loopexit:                    ; preds = %vector.body82
  br label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.preheader.loopexit, %for.cond4.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %for.cond4.preheader.us ], [ 1297, %for.inc.us.preheader.loopexit ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %add17.us, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv
  %39 = load double, double* %arrayidx9.us, align 8
  %sub12.us = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv52, i64 %sub12.us
  %40 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %39, %40
  %add17.us = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv52, i64 %add17.us
  %41 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %41
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %add21.us, i64 %indvars.iv
  %42 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %42
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %sub27.us, i64 %indvars.iv
  %43 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %43
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv52, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond = icmp eq i64 %add17.us, 1299
  br i1 %exitcond, label %for.cond4.for.inc37_crit_edge.us, label %for.inc.us, !llvm.loop !9

for.cond4.for.inc37_crit_edge.us:                 ; preds = %for.inc.us
  %exitcond55 = icmp eq i64 %add21.us, 1299
  %indvar.next92 = add i64 %indvar91, 1
  br i1 %exitcond55, label %for.cond44.preheader.us.preheader, label %for.cond4.preheader.us

for.cond44.preheader.us.preheader:                ; preds = %for.cond4.for.inc37_crit_edge.us
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.preheader.us.preheader, %for.cond44.for.inc84_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond44.for.inc84_crit_edge.us ], [ 0, %for.cond44.preheader.us.preheader ]
  %indvars.iv60 = phi i64 [ %add64.us, %for.cond44.for.inc84_crit_edge.us ], [ 1, %for.cond44.preheader.us.preheader ]
  %44 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %44, i64 1
  %scevgep66 = getelementptr [1300 x double], [1300 x double]* %A, i64 %44, i64 1299
  %scevgep68 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %45 = add i64 %indvar, 2
  %scevgep70 = getelementptr [1300 x double], [1300 x double]* %B, i64 %45, i64 1299
  %add64.us = add nuw nsw i64 %indvars.iv60, 1
  %sub70.us = add nsw i64 %indvars.iv60, -1
  %bound0 = icmp ult double* %scevgep, %scevgep70
  %bound1 = icmp ult double* %scevgep68, %scevgep66
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc81.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond44.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %46 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv60, i64 %offset.idx
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !10
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !10
  %50 = add nsw i64 %offset.idx, -1
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv60, i64 %50
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = fadd <2 x double> %wide.load, %wide.load74
  %56 = fadd <2 x double> %wide.load73, %wide.load75
  %57 = add nuw nsw i64 %offset.idx, 1
  %58 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv60, i64 %57
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !10
  %62 = fadd <2 x double> %55, %wide.load76
  %63 = fadd <2 x double> %56, %wide.load77
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %add64.us, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = fadd <2 x double> %62, %wide.load78
  %69 = fadd <2 x double> %63, %wide.load79
  %70 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %sub70.us, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fadd <2 x double> %68, %wide.load80
  %75 = fadd <2 x double> %69, %wide.load81
  %76 = fmul <2 x double> %74, <double 2.000000e-01, double 2.000000e-01>
  %77 = fmul <2 x double> %75, <double 2.000000e-01, double 2.000000e-01>
  %78 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv60, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> %76, <2 x double>* %79, align 8, !alias.scope !13, !noalias !10
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  store <2 x double> %77, <2 x double>* %81, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 1296
  br i1 %82, label %for.inc81.us.preheader.loopexit, label %vector.body, !llvm.loop !15

for.inc81.us.preheader.loopexit:                  ; preds = %vector.body
  br label %for.inc81.us.preheader

for.inc81.us.preheader:                           ; preds = %for.inc81.us.preheader.loopexit, %for.cond44.preheader.us
  %indvars.iv56.ph = phi i64 [ 1, %for.cond44.preheader.us ], [ 1297, %for.inc81.us.preheader.loopexit ]
  br label %for.inc81.us

for.inc81.us:                                     ; preds = %for.inc81.us.preheader, %for.inc81.us
  %indvars.iv56 = phi i64 [ %add60.us, %for.inc81.us ], [ %indvars.iv56.ph, %for.inc81.us.preheader ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv60, i64 %indvars.iv56
  %83 = load double, double* %arrayidx51.us, align 8
  %sub54.us = add nsw i64 %indvars.iv56, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv60, i64 %sub54.us
  %84 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %83, %84
  %add60.us = add nuw nsw i64 %indvars.iv56, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv60, i64 %add60.us
  %85 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %85
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %add64.us, i64 %indvars.iv56
  %86 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %86
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %sub70.us, i64 %indvars.iv56
  %87 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %87
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv56
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond59 = icmp eq i64 %add60.us, 1299
  br i1 %exitcond59, label %for.cond44.for.inc84_crit_edge.us, label %for.inc81.us, !llvm.loop !16

for.cond44.for.inc84_crit_edge.us:                ; preds = %for.inc81.us
  %exitcond63 = icmp eq i64 %add64.us, 1299
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond63, label %for.inc87, label %for.cond44.preheader.us

for.inc87:                                        ; preds = %for.cond44.for.inc84_crit_edge.us
  %inc88 = add nuw nsw i32 %storemerge51, 1
  %exitcond64 = icmp eq i32 %inc88, 500
  br i1 %exitcond64, label %for.end89, label %for.cond1.preheader

for.end89:                                        ; preds = %for.inc87
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1300 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv11, 1300
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next12, 1300
  br i1 %exitcond15, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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
