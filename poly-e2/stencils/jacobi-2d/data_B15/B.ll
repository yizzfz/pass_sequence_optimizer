; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1300 x double]*
  tail call void @init_array(i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call to [1300 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1300 x double]*
  tail call void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %arraydecay3, [1300 x double]* %arraydecay4)
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
  tail call void @print_array(i32 1300, [1300 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) #2 {
entry:
  %0 = sext i32 %n to i64
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.preheader, label %for.end22

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %conv6 = sitofp i32 %n to double
  %1 = insertelement <2 x double> undef, double %conv6, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc20, %for.cond1.preheader.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next5, %for.inc20 ], [ 0, %for.cond1.preheader.preheader ]
  %2 = trunc i64 %indvars.iv49 to i32
  %conv = sitofp i32 %2 to double
  %3 = insertelement <2 x double> undef, double %conv, i32 0
  %mul.v.i0.2 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv7 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %4 = add nuw nsw i64 %indvars.iv7, 2
  %5 = trunc i64 %4 to i32
  %conv4 = sitofp i32 %5 to double
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv7
  %6 = add nuw nsw i64 %indvars.iv7, 3
  %7 = trunc i64 %6 to i32
  %conv11 = sitofp i32 %7 to double
  %mul.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %conv11, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, %mul.v.i1.2
  %add5 = fadd <2 x double> %mul, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add5, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx8, align 8
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv7
  store double %div.v.r2, double* %arrayidx19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc20, label %for.body3

for.inc20:                                        ; preds = %for.body3
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next5, %0
  br i1 %exitcond12, label %for.end22.loopexit, label %for.cond1.preheader

for.end22.loopexit:                               ; preds = %for.inc20
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) #2 {
entry:
  %0 = add i32 %n, -1
  %cmp29 = icmp sgt i32 %tsteps, 0
  br i1 %cmp29, label %for.cond1.preheader.lr.ph, label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = sext i32 %0 to i64
  %cmp221 = icmp sgt i32 %0, 1
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count13 = zext i32 %0 to i64
  %cmp4226 = icmp sgt i32 %0, 1
  %2 = add nsw i64 %wide.trip.count13, -1
  %min.iters.check59 = icmp ult i64 %2, 4
  %n.vec62 = and i64 %2, -4
  %cmp.zero63 = icmp eq i64 %n.vec62, 0
  %ind.end84 = or i64 %n.vec62, 1
  %cmp.n85 = icmp eq i64 %2, %n.vec62
  %min.iters.check = icmp ult i64 %2, 4
  %n.vec = and i64 %2, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %2, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %for.cond1.preheader.lr.ph
  %storemerge30 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  br i1 %cmp221, label %for.cond4.preheader.preheader, label %for.inc87

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond40.preheader:                             ; preds = %for.inc37
  br i1 %cmp4226, label %for.cond44.preheader.preheader, label %for.inc87

for.cond44.preheader.preheader:                   ; preds = %for.cond40.preheader
  br label %for.cond44.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc37
  %indvar65 = phi i64 [ %indvar.next66, %for.inc37 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv622 = phi i64 [ %indvars.iv.next7, %for.inc37 ], [ 1, %for.cond4.preheader.preheader ]
  %3 = add nuw nsw i64 %indvar65, 1
  %scevgep67 = getelementptr [1300 x double], [1300 x double]* %B, i64 %3, i64 1
  %scevgep69 = getelementptr [1300 x double], [1300 x double]* %B, i64 %3, i64 %wide.trip.count13
  %scevgep71 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar65, i64 1
  %4 = add nuw nsw i64 %indvar65, 2
  %scevgep73 = getelementptr [1300 x double], [1300 x double]* %A, i64 %4, i64 %wide.trip.count13
  %5 = add nuw nsw i64 %indvars.iv622, 1
  %6 = add nsw i64 %indvars.iv622, -1
  br i1 %min.iters.check59, label %for.body7.preheader, label %min.iters.checked60

min.iters.checked60:                              ; preds = %for.cond4.preheader
  br i1 %cmp.zero63, label %for.body7.preheader, label %vector.memcheck79

vector.memcheck79:                                ; preds = %min.iters.checked60
  %bound075 = icmp ult double* %scevgep67, %scevgep73
  %bound176 = icmp ult double* %scevgep71, %scevgep69
  %memcheck.conflict78 = and i1 %bound075, %bound176
  br i1 %memcheck.conflict78, label %for.body7.preheader, label %vector.body56.preheader

vector.body56.preheader:                          ; preds = %vector.memcheck79
  br label %vector.body56

vector.body56:                                    ; preds = %vector.body56.preheader, %vector.body56
  %index81 = phi i64 [ %index.next82, %vector.body56 ], [ 0, %vector.body56.preheader ]
  %offset.idx86 = or i64 %index81, 1
  %7 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv622, i64 %offset.idx86
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = add nsw i64 %offset.idx86, -1
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv622, i64 %11
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load91, %wide.load93
  %17 = fadd <2 x double> %wide.load92, %wide.load94
  %18 = add nuw nsw i64 %offset.idx86, 1
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv622, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %16, %wide.load95
  %24 = fadd <2 x double> %17, %wide.load96
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %5, i64 %offset.idx86
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %23, %wide.load97
  %30 = fadd <2 x double> %24, %wide.load98
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %6, i64 %offset.idx86
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %29, %wide.load99
  %36 = fadd <2 x double> %30, %wide.load100
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = fmul <2 x double> %36, <double 2.000000e-01, double 2.000000e-01>
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv622, i64 %offset.idx86
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next82 = add i64 %index81, 4
  %43 = icmp eq i64 %index.next82, %n.vec62
  br i1 %43, label %middle.block57, label %vector.body56, !llvm.loop !6

middle.block57:                                   ; preds = %vector.body56
  br i1 %cmp.n85, label %for.inc37, label %for.body7.preheader

for.body7.preheader:                              ; preds = %middle.block57, %vector.memcheck79, %min.iters.checked60, %for.cond4.preheader
  %indvars.iv20.ph = phi i64 [ 1, %vector.memcheck79 ], [ 1, %min.iters.checked60 ], [ 1, %for.cond4.preheader ], [ %ind.end84, %middle.block57 ]
  br label %for.body7

for.body7:                                        ; preds = %for.body7.preheader, %for.body7
  %indvars.iv20 = phi i64 [ %indvars.iv.next, %for.body7 ], [ %indvars.iv20.ph, %for.body7.preheader ]
  %arrayidx9 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv622, i64 %indvars.iv20
  %44 = load double, double* %arrayidx9, align 8
  %45 = add nsw i64 %indvars.iv20, -1
  %arrayidx14 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv622, i64 %45
  %46 = load double, double* %arrayidx14, align 8
  %add = fadd double %44, %46
  %indvars.iv.next = add nuw nsw i64 %indvars.iv20, 1
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv622, i64 %indvars.iv.next
  %47 = load double, double* %arrayidx19, align 8
  %add20 = fadd double %add, %47
  %arrayidx25 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %5, i64 %indvars.iv20
  %48 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add20, %48
  %arrayidx31 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %6, i64 %indvars.iv20
  %49 = load double, double* %arrayidx31, align 8
  %add32 = fadd double %add26, %49
  %mul = fmul double %add32, 2.000000e-01
  %arrayidx36 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv622, i64 %indvars.iv20
  store double %mul, double* %arrayidx36, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc37.loopexit, label %for.body7, !llvm.loop !9

for.inc37.loopexit:                               ; preds = %for.body7
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.loopexit, %middle.block57
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv622, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next7, %1
  %indvar.next66 = add nuw nsw i64 %indvar65, 1
  br i1 %exitcond33, label %for.cond40.preheader, label %for.cond4.preheader

for.cond44.preheader:                             ; preds = %for.cond44.preheader.preheader, %for.inc84
  %indvar = phi i64 [ %indvar.next, %for.inc84 ], [ 0, %for.cond44.preheader.preheader ]
  %indvars.iv1527 = phi i64 [ %indvars.iv.next16, %for.inc84 ], [ 1, %for.cond44.preheader.preheader ]
  %50 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %50, i64 1
  %scevgep40 = getelementptr [1300 x double], [1300 x double]* %A, i64 %50, i64 %wide.trip.count13
  %scevgep42 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %51 = add nuw nsw i64 %indvar, 2
  %scevgep44 = getelementptr [1300 x double], [1300 x double]* %B, i64 %51, i64 %wide.trip.count13
  %52 = add nuw nsw i64 %indvars.iv1527, 1
  %53 = add nsw i64 %indvars.iv1527, -1
  br i1 %min.iters.check, label %for.body47.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond44.preheader
  br i1 %cmp.zero, label %for.body47.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep44
  %bound1 = icmp ult double* %scevgep42, %scevgep40
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1527, i64 %offset.idx
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !10
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = add nsw i64 %offset.idx, -1
  %59 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1527, i64 %58
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = fadd <2 x double> %wide.load, %wide.load48
  %64 = fadd <2 x double> %wide.load47, %wide.load49
  %65 = add nuw nsw i64 %offset.idx, 1
  %66 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1527, i64 %65
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = fadd <2 x double> %63, %wide.load50
  %71 = fadd <2 x double> %64, %wide.load51
  %72 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %52, i64 %offset.idx
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = fadd <2 x double> %70, %wide.load52
  %77 = fadd <2 x double> %71, %wide.load53
  %78 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %53, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fadd <2 x double> %76, %wide.load54
  %83 = fadd <2 x double> %77, %wide.load55
  %84 = fmul <2 x double> %82, <double 2.000000e-01, double 2.000000e-01>
  %85 = fmul <2 x double> %83, <double 2.000000e-01, double 2.000000e-01>
  %86 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv1527, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  store <2 x double> %84, <2 x double>* %87, align 8, !alias.scope !13, !noalias !10
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  store <2 x double> %85, <2 x double>* %89, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %90 = icmp eq i64 %index.next, %n.vec
  br i1 %90, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc84, label %for.body47.preheader

for.body47.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond44.preheader
  %indvars.iv1025.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond44.preheader ], [ %ind.end, %middle.block ]
  br label %for.body47

for.body47:                                       ; preds = %for.body47.preheader, %for.body47
  %indvars.iv1025 = phi i64 [ %indvars.iv.next11, %for.body47 ], [ %indvars.iv1025.ph, %for.body47.preheader ]
  %arrayidx51 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1527, i64 %indvars.iv1025
  %91 = load double, double* %arrayidx51, align 8
  %92 = add nsw i64 %indvars.iv1025, -1
  %arrayidx56 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1527, i64 %92
  %93 = load double, double* %arrayidx56, align 8
  %add57 = fadd double %91, %93
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1025, 1
  %arrayidx62 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1527, i64 %indvars.iv.next11
  %94 = load double, double* %arrayidx62, align 8
  %add63 = fadd double %add57, %94
  %arrayidx68 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %52, i64 %indvars.iv1025
  %95 = load double, double* %arrayidx68, align 8
  %add69 = fadd double %add63, %95
  %arrayidx74 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %53, i64 %indvars.iv1025
  %96 = load double, double* %arrayidx74, align 8
  %add75 = fadd double %add69, %96
  %mul76 = fmul double %add75, 2.000000e-01
  %arrayidx80 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv1527, i64 %indvars.iv1025
  store double %mul76, double* %arrayidx80, align 8
  %exitcond14 = icmp eq i64 %indvars.iv.next11, %wide.trip.count13
  br i1 %exitcond14, label %for.inc84.loopexit, label %for.body47, !llvm.loop !16

for.inc84.loopexit:                               ; preds = %for.body47
  br label %for.inc84

for.inc84:                                        ; preds = %for.inc84.loopexit, %middle.block
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1527, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next16, %1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond35, label %for.inc87.loopexit, label %for.cond44.preheader

for.inc87.loopexit:                               ; preds = %for.inc84
  br label %for.inc87

for.inc87:                                        ; preds = %for.inc87.loopexit, %for.cond1.preheader, %for.cond40.preheader
  %inc88 = add nuw nsw i32 %storemerge30, 1
  %exitcond37 = icmp eq i32 %inc88, %tsteps
  br i1 %exitcond37, label %for.end89.loopexit, label %for.cond1.preheader

for.end89.loopexit:                               ; preds = %for.inc87
  br label %for.end89

for.end89:                                        ; preds = %for.end89.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [1300 x double]* nocapture readonly %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %3 = sext i32 %n to i64
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next4, %for.inc10 ], [ 0, %for.cond2.preheader.preheader ]
  %4 = mul nsw i64 %indvars.iv39, %3
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %if.end
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %5 = add nsw i64 %indvars.iv7, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv7
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next4, %3
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader

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
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
