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
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array([1300 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end.for.cond1.preheader_crit_edge, %entry
  %indvars.iv37 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.end.for.cond1.preheader_crit_edge ]
  %0 = trunc i64 %indvars.iv37 to i32
  %conv = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %mul.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.cond1.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3.for.body3_crit_edge ]
  %2 = add nuw nsw i64 %indvars.iv6, 2
  %3 = trunc i64 %2 to i32
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv6
  %4 = add nuw nsw i64 %indvars.iv6, 3
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
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv37, i64 %indvars.iv6
  store double %div.v.r2, double* %arrayidx19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.end, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  br label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1300
  br i1 %exitcond5, label %for.end22, label %for.end.for.cond1.preheader_crit_edge

for.end.for.cond1.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond1.preheader

for.end22:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d([1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end86.for.cond1.preheader_crit_edge, %entry
  %0 = phi i32 [ 0, %entry ], [ %inc88, %for.end86.for.cond1.preheader_crit_edge ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end.for.cond4.preheader_crit_edge, %for.cond1.preheader
  %indvar47 = phi i64 [ %indvar.next48, %for.end.for.cond4.preheader_crit_edge ], [ 0, %for.cond1.preheader ]
  %indvars.iv620 = phi i64 [ %indvars.iv.next7, %for.end.for.cond4.preheader_crit_edge ], [ 1, %for.cond1.preheader ]
  %1 = add i64 %indvar47, 1
  %scevgep49 = getelementptr [1300 x double], [1300 x double]* %B, i64 %1, i64 1
  %scevgep51 = getelementptr [1300 x double], [1300 x double]* %B, i64 %1, i64 1299
  %scevgep53 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar47, i64 1
  %2 = add i64 %indvar47, 2
  %scevgep55 = getelementptr [1300 x double], [1300 x double]* %A, i64 %2, i64 1299
  %3 = add nuw nsw i64 %indvars.iv620, 1
  %4 = add nsw i64 %indvars.iv620, -1
  %bound057 = icmp ult double* %scevgep49, %scevgep55
  %bound158 = icmp ult double* %scevgep53, %scevgep51
  %memcheck.conflict60 = and i1 %bound057, %bound158
  br i1 %memcheck.conflict60, label %for.cond4.preheader.for.body7.preheader_crit_edge, label %vector.body42.preheader

for.cond4.preheader.for.body7.preheader_crit_edge: ; preds = %for.cond4.preheader
  br label %for.body7.preheader

vector.body42.preheader:                          ; preds = %for.cond4.preheader
  br label %vector.body42

vector.body42:                                    ; preds = %vector.body42.vector.body42_crit_edge, %vector.body42.preheader
  %index63 = phi i64 [ %index.next64, %vector.body42.vector.body42_crit_edge ], [ 0, %vector.body42.preheader ]
  %offset.idx67 = or i64 %index63, 1
  %5 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv620, i64 %offset.idx67
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = add nsw i64 %offset.idx67, -1
  %10 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv620, i64 %9
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load72, %wide.load74
  %15 = fadd <2 x double> %wide.load73, %wide.load75
  %16 = add nuw nsw i64 %offset.idx67, 1
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv620, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %14, %wide.load76
  %22 = fadd <2 x double> %15, %wide.load77
  %23 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %3, i64 %offset.idx67
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %21, %wide.load78
  %28 = fadd <2 x double> %22, %wide.load79
  %29 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %4, i64 %offset.idx67
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %27, %wide.load80
  %34 = fadd <2 x double> %28, %wide.load81
  %35 = fmul <2 x double> %33, <double 2.000000e-01, double 2.000000e-01>
  %36 = fmul <2 x double> %34, <double 2.000000e-01, double 2.000000e-01>
  %37 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv620, i64 %offset.idx67
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %35, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %36, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next64 = add i64 %index63, 4
  %41 = icmp eq i64 %index.next64, 1296
  br i1 %41, label %for.body7.preheader.loopexit, label %vector.body42.vector.body42_crit_edge, !llvm.loop !6

vector.body42.vector.body42_crit_edge:            ; preds = %vector.body42
  br label %vector.body42

for.body7.preheader.loopexit:                     ; preds = %vector.body42
  br label %for.body7.preheader

for.body7.preheader:                              ; preds = %for.cond4.preheader.for.body7.preheader_crit_edge, %for.body7.preheader.loopexit
  %indvars.iv19.ph = phi i64 [ 1, %for.cond4.preheader.for.body7.preheader_crit_edge ], [ 1297, %for.body7.preheader.loopexit ]
  br label %for.body7

for.body7:                                        ; preds = %for.body7.for.body7_crit_edge, %for.body7.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next, %for.body7.for.body7_crit_edge ], [ %indvars.iv19.ph, %for.body7.preheader ]
  %arrayidx9 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv620, i64 %indvars.iv19
  %42 = load double, double* %arrayidx9, align 8
  %43 = add nsw i64 %indvars.iv19, -1
  %arrayidx14 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv620, i64 %43
  %44 = load double, double* %arrayidx14, align 8
  %add = fadd double %42, %44
  %indvars.iv.next = add nuw nsw i64 %indvars.iv19, 1
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv620, i64 %indvars.iv.next
  %45 = load double, double* %arrayidx19, align 8
  %add20 = fadd double %add, %45
  %arrayidx25 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %3, i64 %indvars.iv19
  %46 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add20, %46
  %arrayidx31 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %4, i64 %indvars.iv19
  %47 = load double, double* %arrayidx31, align 8
  %add32 = fadd double %add26, %47
  %mul = fmul double %add32, 2.000000e-01
  %arrayidx36 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv620, i64 %indvars.iv19
  store double %mul, double* %arrayidx36, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %for.end, label %for.body7.for.body7_crit_edge, !llvm.loop !9

for.body7.for.body7_crit_edge:                    ; preds = %for.body7
  br label %for.body7

for.end:                                          ; preds = %for.body7
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv620, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next7, 1299
  br i1 %exitcond23, label %for.cond44.preheader.preheader, label %for.end.for.cond4.preheader_crit_edge

for.end.for.cond4.preheader_crit_edge:            ; preds = %for.end
  %indvar.next48 = add i64 %indvar47, 1
  br label %for.cond4.preheader

for.cond44.preheader.preheader:                   ; preds = %for.end
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.end83.for.cond44.preheader_crit_edge, %for.cond44.preheader.preheader
  %indvar = phi i64 [ %indvar.next, %for.end83.for.cond44.preheader_crit_edge ], [ 0, %for.cond44.preheader.preheader ]
  %indvars.iv1422 = phi i64 [ %indvars.iv.next15, %for.end83.for.cond44.preheader_crit_edge ], [ 1, %for.cond44.preheader.preheader ]
  %48 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %48, i64 1
  %scevgep26 = getelementptr [1300 x double], [1300 x double]* %A, i64 %48, i64 1299
  %scevgep28 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %49 = add i64 %indvar, 2
  %scevgep30 = getelementptr [1300 x double], [1300 x double]* %B, i64 %49, i64 1299
  %50 = add nuw nsw i64 %indvars.iv1422, 1
  %51 = add nsw i64 %indvars.iv1422, -1
  %bound0 = icmp ult double* %scevgep, %scevgep30
  %bound1 = icmp ult double* %scevgep28, %scevgep26
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.cond44.preheader.for.body47.preheader_crit_edge, label %vector.body.preheader

for.cond44.preheader.for.body47.preheader_crit_edge: ; preds = %for.cond44.preheader
  br label %for.body47.preheader

vector.body.preheader:                            ; preds = %for.cond44.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1422, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !10
  %56 = add nsw i64 %offset.idx, -1
  %57 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1422, i64 %56
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10
  %61 = fadd <2 x double> %wide.load, %wide.load34
  %62 = fadd <2 x double> %wide.load33, %wide.load35
  %63 = add nuw nsw i64 %offset.idx, 1
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1422, i64 %63
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = fadd <2 x double> %61, %wide.load36
  %69 = fadd <2 x double> %62, %wide.load37
  %70 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %50, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fadd <2 x double> %68, %wide.load38
  %75 = fadd <2 x double> %69, %wide.load39
  %76 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %51, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fadd <2 x double> %74, %wide.load40
  %81 = fadd <2 x double> %75, %wide.load41
  %82 = fmul <2 x double> %80, <double 2.000000e-01, double 2.000000e-01>
  %83 = fmul <2 x double> %81, <double 2.000000e-01, double 2.000000e-01>
  %84 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv1422, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  store <2 x double> %82, <2 x double>* %85, align 8, !alias.scope !13, !noalias !10
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  store <2 x double> %83, <2 x double>* %87, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %88 = icmp eq i64 %index.next, 1296
  br i1 %88, label %for.body47.preheader.loopexit, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.body47.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body47.preheader

for.body47.preheader:                             ; preds = %for.cond44.preheader.for.body47.preheader_crit_edge, %for.body47.preheader.loopexit
  %indvars.iv1021.ph = phi i64 [ 1, %for.cond44.preheader.for.body47.preheader_crit_edge ], [ 1297, %for.body47.preheader.loopexit ]
  br label %for.body47

for.body47:                                       ; preds = %for.body47.for.body47_crit_edge, %for.body47.preheader
  %indvars.iv1021 = phi i64 [ %indvars.iv.next11, %for.body47.for.body47_crit_edge ], [ %indvars.iv1021.ph, %for.body47.preheader ]
  %arrayidx51 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1422, i64 %indvars.iv1021
  %89 = load double, double* %arrayidx51, align 8
  %90 = add nsw i64 %indvars.iv1021, -1
  %arrayidx56 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1422, i64 %90
  %91 = load double, double* %arrayidx56, align 8
  %add57 = fadd double %89, %91
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1021, 1
  %arrayidx62 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1422, i64 %indvars.iv.next11
  %92 = load double, double* %arrayidx62, align 8
  %add63 = fadd double %add57, %92
  %arrayidx68 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %50, i64 %indvars.iv1021
  %93 = load double, double* %arrayidx68, align 8
  %add69 = fadd double %add63, %93
  %arrayidx74 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %51, i64 %indvars.iv1021
  %94 = load double, double* %arrayidx74, align 8
  %add75 = fadd double %add69, %94
  %mul76 = fmul double %add75, 2.000000e-01
  %arrayidx80 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv1422, i64 %indvars.iv1021
  store double %mul76, double* %arrayidx80, align 8
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1299
  br i1 %exitcond13, label %for.end83, label %for.body47.for.body47_crit_edge, !llvm.loop !16

for.body47.for.body47_crit_edge:                  ; preds = %for.body47
  br label %for.body47

for.end83:                                        ; preds = %for.body47
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1422, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next15, 1299
  br i1 %exitcond24, label %for.end86, label %for.end83.for.cond44.preheader_crit_edge

for.end83.for.cond44.preheader_crit_edge:         ; preds = %for.end83
  %indvar.next = add i64 %indvar, 1
  br label %for.cond44.preheader

for.end86:                                        ; preds = %for.end83
  %inc88 = add nuw nsw i32 %0, 1
  %exitcond18 = icmp eq i32 %inc88, 500
  br i1 %exitcond18, label %for.end89, label %for.end86.for.cond1.preheader_crit_edge

for.end86.for.cond1.preheader_crit_edge:          ; preds = %for.end86
  br label %for.cond1.preheader

for.end89:                                        ; preds = %for.end86
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end.for.cond2.preheader_crit_edge, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end.for.cond2.preheader_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv27, 1300
  br label %for.body4

for.body4:                                        ; preds = %if.end.for.body4_crit_edge, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end.for.body4_crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.body4.if.end_crit_edge

for.body4.if.end_crit_edge:                       ; preds = %for.body4
  br label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4.if.end_crit_edge, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv6
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.end, label %if.end.for.body4_crit_edge

if.end.for.body4_crit_edge:                       ; preds = %if.end
  br label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1300
  br i1 %exitcond5, label %for.end12, label %for.end.for.cond2.preheader_crit_edge

for.end.for.cond2.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond2.preheader

for.end12:                                        ; preds = %for.end
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
