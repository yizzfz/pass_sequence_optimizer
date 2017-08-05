; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call to [1300 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1300 x double]*
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %arraydecay3, [1300 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [1300 x double]* %A, [1300 x double]* %B) unnamed_addr #2 {
entry:
  %cmp12 = icmp sgt i32 %n, 0
  br i1 %cmp12, label %for.cond1.preheader.lr.ph, label %for.end22

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv6 = sitofp i32 %n to double
  %0 = zext i32 %n to i64
  %1 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %2 = trunc i64 %indvars.iv16 to i32
  %conv.us = sitofp i32 %2 to double
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us ]
  %3 = add nuw nsw i64 %indvars.iv, 2
  %4 = trunc i64 %3 to i32
  %conv4.us = sitofp i32 %4 to double
  %mul.us = fmul double %conv.us, %conv4.us
  %add5.us = fadd double %mul.us, 2.000000e+00
  %div.us = fdiv double %add5.us, %conv6
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  store double %div.us, double* %arrayidx8.us, align 8
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv11.us = sitofp i32 %6 to double
  %mul12.us = fmul double %conv.us, %conv11.us
  %add13.us = fadd double %mul12.us, 3.000000e+00
  %div15.us = fdiv double %add13.us, %conv6
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv16, i64 %indvars.iv
  store double %div15.us, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, %0
  br i1 %exitcond20, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %1
  br i1 %exitcond, label %for.end22.loopexit, label %for.cond1.preheader.us

for.end22.loopexit:                               ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* %A, [1300 x double]* %B) unnamed_addr #2 {
entry:
  %cmp52 = icmp sgt i32 %tsteps, 0
  br i1 %cmp52, label %for.cond1.preheader.lr.ph, label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp246 = icmp sgt i32 %sub, 1
  %0 = zext i32 %sub to i64
  %1 = zext i32 %sub to i64
  %wide.trip.count58 = zext i32 %sub to i64
  %cmp4250 = icmp sgt i32 %sub, 1
  %wide.trip.count68 = zext i32 %sub to i64
  %2 = add nsw i64 %1, -1
  %min.iters.check93 = icmp ult i64 %2, 4
  %n.vec96 = and i64 %2, -4
  %cmp.zero97 = icmp eq i64 %n.vec96, 0
  %ind.end118 = or i64 %n.vec96, 1
  %cmp.n119 = icmp eq i64 %2, %n.vec96
  %min.iters.check = icmp ult i64 %2, 4
  %n.vec = and i64 %2, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %2, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %for.cond1.preheader.lr.ph
  %storemerge53 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  br i1 %cmp246, label %for.cond4.preheader.us.preheader, label %for.inc87

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.inc37_crit_edge.us
  %indvar99 = phi i64 [ %indvar.next100, %for.cond4.for.inc37_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond4.for.inc37_crit_edge.us ], [ 1, %for.cond4.preheader.us.preheader ]
  %3 = add i64 %indvar99, 1
  %scevgep101 = getelementptr [1300 x double], [1300 x double]* %B, i64 %3, i64 1
  %scevgep103 = getelementptr [1300 x double], [1300 x double]* %B, i64 %3, i64 %1
  %scevgep105 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar99, i64 1
  %4 = add i64 %indvar99, 2
  %scevgep107 = getelementptr [1300 x double], [1300 x double]* %A, i64 %4, i64 %1
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %5 = add nsw i64 %indvars.iv55, -1
  br i1 %min.iters.check93, label %for.body7.us.preheader, label %min.iters.checked94

min.iters.checked94:                              ; preds = %for.cond4.preheader.us
  br i1 %cmp.zero97, label %for.body7.us.preheader, label %vector.memcheck113

vector.memcheck113:                               ; preds = %min.iters.checked94
  %bound0109 = icmp ult double* %scevgep101, %scevgep107
  %bound1110 = icmp ult double* %scevgep105, %scevgep103
  %memcheck.conflict112 = and i1 %bound0109, %bound1110
  br i1 %memcheck.conflict112, label %for.body7.us.preheader, label %vector.body90.preheader

vector.body90.preheader:                          ; preds = %vector.memcheck113
  br label %vector.body90

vector.body90:                                    ; preds = %vector.body90.preheader, %vector.body90
  %index115 = phi i64 [ %index.next116, %vector.body90 ], [ 0, %vector.body90.preheader ]
  %offset.idx120 = or i64 %index115, 1
  %6 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv55, i64 %offset.idx120
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = add nsw i64 %offset.idx120, -1
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv55, i64 %10
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fadd <2 x double> %wide.load125, %wide.load127
  %16 = fadd <2 x double> %wide.load126, %wide.load128
  %17 = add nuw nsw i64 %offset.idx120, 1
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv55, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %15, %wide.load129
  %23 = fadd <2 x double> %16, %wide.load130
  %24 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next56, i64 %offset.idx120
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %22, %wide.load131
  %29 = fadd <2 x double> %23, %wide.load132
  %30 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %5, i64 %offset.idx120
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %28, %wide.load133
  %35 = fadd <2 x double> %29, %wide.load134
  %36 = fmul <2 x double> %34, <double 2.000000e-01, double 2.000000e-01>
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv55, i64 %offset.idx120
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %36, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %37, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %index.next116 = add i64 %index115, 4
  %42 = icmp eq i64 %index.next116, %n.vec96
  br i1 %42, label %middle.block91, label %vector.body90, !llvm.loop !6

middle.block91:                                   ; preds = %vector.body90
  br i1 %cmp.n119, label %for.cond4.for.inc37_crit_edge.us, label %for.body7.us.preheader

for.body7.us.preheader:                           ; preds = %middle.block91, %vector.memcheck113, %min.iters.checked94, %for.cond4.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck113 ], [ 1, %min.iters.checked94 ], [ 1, %for.cond4.preheader.us ], [ %ind.end118, %middle.block91 ]
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us.preheader, %for.body7.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7.us ], [ %indvars.iv.ph, %for.body7.us.preheader ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv
  %43 = load double, double* %arrayidx9.us, align 8
  %44 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv55, i64 %44
  %45 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %43, %45
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv.next
  %46 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %46
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next56, i64 %indvars.iv
  %47 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %47
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %5, i64 %indvars.iv
  %48 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %48
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond71 = icmp eq i64 %indvars.iv.next, %0
  br i1 %exitcond71, label %for.cond4.for.inc37_crit_edge.us.loopexit, label %for.body7.us, !llvm.loop !9

for.cond4.for.inc37_crit_edge.us.loopexit:        ; preds = %for.body7.us
  br label %for.cond4.for.inc37_crit_edge.us

for.cond4.for.inc37_crit_edge.us:                 ; preds = %for.cond4.for.inc37_crit_edge.us.loopexit, %middle.block91
  %exitcond59 = icmp eq i64 %indvars.iv.next56, %wide.trip.count58
  %indvar.next100 = add i64 %indvar99, 1
  br i1 %exitcond59, label %for.cond40.preheader, label %for.cond4.preheader.us

for.cond40.preheader:                             ; preds = %for.cond4.for.inc37_crit_edge.us
  br i1 %cmp4250, label %for.cond44.preheader.us.preheader, label %for.inc87

for.cond44.preheader.us.preheader:                ; preds = %for.cond40.preheader
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.preheader.us.preheader, %for.cond44.for.inc84_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond44.for.inc84_crit_edge.us ], [ 0, %for.cond44.preheader.us.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.cond44.for.inc84_crit_edge.us ], [ 1, %for.cond44.preheader.us.preheader ]
  %49 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %49, i64 1
  %scevgep74 = getelementptr [1300 x double], [1300 x double]* %A, i64 %49, i64 %1
  %scevgep76 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %50 = add i64 %indvar, 2
  %scevgep78 = getelementptr [1300 x double], [1300 x double]* %B, i64 %50, i64 %1
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %51 = add nsw i64 %indvars.iv65, -1
  br i1 %min.iters.check, label %for.body47.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond44.preheader.us
  br i1 %cmp.zero, label %for.body47.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep78
  %bound1 = icmp ult double* %scevgep76, %scevgep74
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv65, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !10
  %56 = add nsw i64 %offset.idx, -1
  %57 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv65, i64 %56
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10
  %61 = fadd <2 x double> %wide.load, %wide.load82
  %62 = fadd <2 x double> %wide.load81, %wide.load83
  %63 = add nuw nsw i64 %offset.idx, 1
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv65, i64 %63
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = fadd <2 x double> %61, %wide.load84
  %69 = fadd <2 x double> %62, %wide.load85
  %70 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next66, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fadd <2 x double> %68, %wide.load86
  %75 = fadd <2 x double> %69, %wide.load87
  %76 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %51, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fadd <2 x double> %74, %wide.load88
  %81 = fadd <2 x double> %75, %wide.load89
  %82 = fmul <2 x double> %80, <double 2.000000e-01, double 2.000000e-01>
  %83 = fmul <2 x double> %81, <double 2.000000e-01, double 2.000000e-01>
  %84 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv65, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  store <2 x double> %82, <2 x double>* %85, align 8, !alias.scope !13, !noalias !10
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  store <2 x double> %83, <2 x double>* %87, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %88 = icmp eq i64 %index.next, %n.vec
  br i1 %88, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond44.for.inc84_crit_edge.us, label %for.body47.us.preheader

for.body47.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond44.preheader.us
  %indvars.iv60.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond44.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.body47.us.preheader, %for.body47.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.body47.us ], [ %indvars.iv60.ph, %for.body47.us.preheader ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv60
  %89 = load double, double* %arrayidx51.us, align 8
  %90 = add nsw i64 %indvars.iv60, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv65, i64 %90
  %91 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %89, %91
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv.next61
  %92 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %92
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next66, i64 %indvars.iv60
  %93 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %93
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %51, i64 %indvars.iv60
  %94 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %94
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv60
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next61, %1
  br i1 %exitcond, label %for.cond44.for.inc84_crit_edge.us.loopexit, label %for.body47.us, !llvm.loop !16

for.cond44.for.inc84_crit_edge.us.loopexit:       ; preds = %for.body47.us
  br label %for.cond44.for.inc84_crit_edge.us

for.cond44.for.inc84_crit_edge.us:                ; preds = %for.cond44.for.inc84_crit_edge.us.loopexit, %middle.block
  %exitcond69 = icmp eq i64 %indvars.iv.next66, %wide.trip.count68
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond69, label %for.inc87.loopexit, label %for.cond44.preheader.us

for.inc87.loopexit:                               ; preds = %for.cond44.for.inc84_crit_edge.us
  br label %for.inc87

for.inc87:                                        ; preds = %for.inc87.loopexit, %for.cond1.preheader, %for.cond40.preheader
  %inc88 = add nuw nsw i32 %storemerge53, 1
  %exitcond70 = icmp eq i32 %inc88, %tsteps
  br i1 %exitcond70, label %for.end89.loopexit, label %for.cond1.preheader

for.end89.loopexit:                               ; preds = %for.inc87
  br label %for.end89

for.end89:                                        ; preds = %for.end89.loopexit, %entry
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
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  %5 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond18, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %5
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
