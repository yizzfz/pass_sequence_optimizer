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
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1300 x double]*
  tail call void @init_array(i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
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
  %1 = bitcast i8* %call to [1300 x double]*
  tail call void @print_array(i32 1300, [1300 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, [1300 x double]* %A, [1300 x double]* %B) #2 {
entry:
  %0 = sext i32 %n to i64
  %cmp20 = icmp sgt i32 %n, 0
  br i1 %cmp20, label %for.cond1.preheader.preheader, label %for.end22

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  %conv6 = sitofp i32 %n to double
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc20, %for.cond1.preheader.preheader
  %indvars.iv1621 = phi i64 [ %indvars.iv.next17, %for.inc20 ], [ 0, %for.cond1.preheader.preheader ]
  %1 = trunc i64 %indvars.iv1621 to i32
  %conv = sitofp i32 %1 to double
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv19 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %2 = add nuw nsw i64 %indvars.iv19, 2
  %3 = trunc i64 %2 to i32
  %conv4 = sitofp i32 %3 to double
  %mul = fmul double %conv, %conv4
  %add5 = fadd double %mul, 2.000000e+00
  %div = fdiv double %add5, %conv6
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv1621, i64 %indvars.iv19
  store double %div, double* %arrayidx8, align 8
  %4 = add nuw nsw i64 %indvars.iv19, 3
  %5 = trunc i64 %4 to i32
  %conv11 = sitofp i32 %5 to double
  %mul12 = fmul double %conv, %conv11
  %add13 = fadd double %mul12, 3.000000e+00
  %div15 = fdiv double %add13, %conv6
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv1621, i64 %indvars.iv19
  store double %div15, double* %arrayidx19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc20, label %for.body3

for.inc20:                                        ; preds = %for.body3
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1621, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next17, %0
  br i1 %exitcond24, label %for.end22.loopexit, label %for.cond1.preheader

for.end22.loopexit:                               ; preds = %for.inc20
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* %A, [1300 x double]* %B) #2 {
entry:
  %0 = add i32 %n, -1
  %cmp69 = icmp sgt i32 %tsteps, 0
  br i1 %cmp69, label %for.cond1.preheader.lr.ph, label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %1 = sext i32 %sub to i64
  %wide.trip.count53 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %2 = icmp eq i32 %0, 1
  %3 = icmp sgt i32 %0, 1
  %4 = add nsw i64 %wide.trip.count53, -1
  %.not = icmp slt i32 %n, 3
  %brmerge = or i1 %.not, %2
  %min.iters.check = icmp ult i64 %4, 4
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %4, %n.vec
  %min.iters.check98 = icmp ult i64 %4, 4
  %n.vec101 = and i64 %4, -4
  %cmp.zero102 = icmp eq i64 %n.vec101, 0
  %ind.end123 = or i64 %n.vec101, 1
  %cmp.n124 = icmp eq i64 %4, %n.vec101
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %for.cond1.preheader.lr.ph
  %t.070 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  br i1 %brmerge, label %for.cond40.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond40.preheader.loopexit:                    ; preds = %for.inc37
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.cond1.preheader
  br i1 %3, label %for.cond44.preheader.preheader, label %for.inc87

for.cond44.preheader.preheader:                   ; preds = %for.cond40.preheader
  br label %for.cond44.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc37
  %indvar104 = phi i64 [ %indvar.next105, %for.inc37 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv4662 = phi i64 [ %indvars.iv.next47, %for.inc37 ], [ 1, %for.cond4.preheader.preheader ]
  %5 = add i64 %indvar104, 1
  %scevgep106 = getelementptr [1300 x double], [1300 x double]* %B, i64 %5, i64 1
  %scevgep108 = getelementptr [1300 x double], [1300 x double]* %B, i64 %5, i64 %wide.trip.count53
  %scevgep110 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar104, i64 1
  %6 = add i64 %indvar104, 2
  %scevgep112 = getelementptr [1300 x double], [1300 x double]* %A, i64 %6, i64 %wide.trip.count53
  %7 = add nuw nsw i64 %indvars.iv4662, 1
  %8 = add nsw i64 %indvars.iv4662, -1
  br i1 %min.iters.check98, label %for.body7.preheader, label %min.iters.checked99

min.iters.checked99:                              ; preds = %for.cond4.preheader
  br i1 %cmp.zero102, label %for.body7.preheader, label %vector.memcheck118

vector.memcheck118:                               ; preds = %min.iters.checked99
  %bound0114 = icmp ult double* %scevgep106, %scevgep112
  %bound1115 = icmp ult double* %scevgep110, %scevgep108
  %memcheck.conflict117 = and i1 %bound0114, %bound1115
  br i1 %memcheck.conflict117, label %for.body7.preheader, label %vector.body95.preheader

vector.body95.preheader:                          ; preds = %vector.memcheck118
  br label %vector.body95

vector.body95:                                    ; preds = %vector.body95.preheader, %vector.body95
  %index120 = phi i64 [ %index.next121, %vector.body95 ], [ 0, %vector.body95.preheader ]
  %offset.idx125 = or i64 %index120, 1
  %9 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv4662, i64 %offset.idx125
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = add nsw i64 %offset.idx125, -1
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv4662, i64 %13
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load130, %wide.load132
  %19 = fadd <2 x double> %wide.load131, %wide.load133
  %20 = add nuw nsw i64 %offset.idx125, 1
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv4662, i64 %20
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %18, %wide.load134
  %26 = fadd <2 x double> %19, %wide.load135
  %27 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %7, i64 %offset.idx125
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %25, %wide.load136
  %32 = fadd <2 x double> %26, %wide.load137
  %33 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %8, i64 %offset.idx125
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fadd <2 x double> %31, %wide.load138
  %38 = fadd <2 x double> %32, %wide.load139
  %39 = fmul <2 x double> %37, <double 2.000000e-01, double 2.000000e-01>
  %40 = fmul <2 x double> %38, <double 2.000000e-01, double 2.000000e-01>
  %41 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv4662, i64 %offset.idx125
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %39, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %40, <2 x double>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next121 = add i64 %index120, 4
  %45 = icmp eq i64 %index.next121, %n.vec101
  br i1 %45, label %middle.block96, label %vector.body95, !llvm.loop !6

middle.block96:                                   ; preds = %vector.body95
  br i1 %cmp.n124, label %for.inc37, label %for.body7.preheader

for.body7.preheader:                              ; preds = %middle.block96, %vector.memcheck118, %min.iters.checked99, %for.cond4.preheader
  %indvars.iv60.ph = phi i64 [ 1, %vector.memcheck118 ], [ 1, %min.iters.checked99 ], [ 1, %for.cond4.preheader ], [ %ind.end123, %middle.block96 ]
  br label %for.body7

for.body7:                                        ; preds = %for.body7.preheader, %for.body7
  %indvars.iv60 = phi i64 [ %indvars.iv.next, %for.body7 ], [ %indvars.iv60.ph, %for.body7.preheader ]
  %arrayidx9 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv4662, i64 %indvars.iv60
  %46 = load double, double* %arrayidx9, align 8
  %47 = add nsw i64 %indvars.iv60, -1
  %arrayidx14 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv4662, i64 %47
  %48 = load double, double* %arrayidx14, align 8
  %add = fadd double %46, %48
  %indvars.iv.next = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv4662, i64 %indvars.iv.next
  %49 = load double, double* %arrayidx19, align 8
  %add20 = fadd double %add, %49
  %arrayidx25 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %7, i64 %indvars.iv60
  %50 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add20, %50
  %arrayidx31 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %8, i64 %indvars.iv60
  %51 = load double, double* %arrayidx31, align 8
  %add32 = fadd double %add26, %51
  %mul = fmul double %add32, 2.000000e-01
  %arrayidx36 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv4662, i64 %indvars.iv60
  store double %mul, double* %arrayidx36, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc37.loopexit, label %for.body7, !llvm.loop !9

for.inc37.loopexit:                               ; preds = %for.body7
  br label %for.inc37

for.inc37:                                        ; preds = %for.inc37.loopexit, %middle.block96
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4662, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next47, %1
  %indvar.next105 = add i64 %indvar104, 1
  br i1 %exitcond73, label %for.cond40.preheader.loopexit, label %for.cond4.preheader

for.cond44.preheader:                             ; preds = %for.cond44.preheader.preheader, %for.inc84
  %indvar = phi i64 [ %indvar.next, %for.inc84 ], [ 0, %for.cond44.preheader.preheader ]
  %indvars.iv5567 = phi i64 [ %indvars.iv.next56, %for.inc84 ], [ 1, %for.cond44.preheader.preheader ]
  %52 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %52, i64 1
  %scevgep79 = getelementptr [1300 x double], [1300 x double]* %A, i64 %52, i64 %wide.trip.count53
  %scevgep81 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %53 = add i64 %indvar, 2
  %scevgep83 = getelementptr [1300 x double], [1300 x double]* %B, i64 %53, i64 %wide.trip.count53
  %54 = add nuw nsw i64 %indvars.iv5567, 1
  %55 = add nsw i64 %indvars.iv5567, -1
  br i1 %min.iters.check, label %for.body47.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond44.preheader
  br i1 %cmp.zero, label %for.body47.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep83
  %bound1 = icmp ult double* %scevgep81, %scevgep79
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv5567, i64 %offset.idx
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = add nsw i64 %offset.idx, -1
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv5567, i64 %60
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fadd <2 x double> %wide.load, %wide.load87
  %66 = fadd <2 x double> %wide.load86, %wide.load88
  %67 = add nuw nsw i64 %offset.idx, 1
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv5567, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fadd <2 x double> %65, %wide.load89
  %73 = fadd <2 x double> %66, %wide.load90
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %54, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fadd <2 x double> %72, %wide.load91
  %79 = fadd <2 x double> %73, %wide.load92
  %80 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %55, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = fadd <2 x double> %78, %wide.load93
  %85 = fadd <2 x double> %79, %wide.load94
  %86 = fmul <2 x double> %84, <double 2.000000e-01, double 2.000000e-01>
  %87 = fmul <2 x double> %85, <double 2.000000e-01, double 2.000000e-01>
  %88 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv5567, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  store <2 x double> %86, <2 x double>* %89, align 8, !alias.scope !13, !noalias !10
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  store <2 x double> %87, <2 x double>* %91, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %92 = icmp eq i64 %index.next, %n.vec
  br i1 %92, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc84, label %for.body47.preheader

for.body47.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond44.preheader
  %indvars.iv5065.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond44.preheader ], [ %ind.end, %middle.block ]
  br label %for.body47

for.body47:                                       ; preds = %for.body47.preheader, %for.body47
  %indvars.iv5065 = phi i64 [ %indvars.iv.next51, %for.body47 ], [ %indvars.iv5065.ph, %for.body47.preheader ]
  %arrayidx51 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv5567, i64 %indvars.iv5065
  %93 = load double, double* %arrayidx51, align 8
  %94 = add nsw i64 %indvars.iv5065, -1
  %arrayidx56 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv5567, i64 %94
  %95 = load double, double* %arrayidx56, align 8
  %add57 = fadd double %93, %95
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv5065, 1
  %arrayidx62 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv5567, i64 %indvars.iv.next51
  %96 = load double, double* %arrayidx62, align 8
  %add63 = fadd double %add57, %96
  %arrayidx68 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %54, i64 %indvars.iv5065
  %97 = load double, double* %arrayidx68, align 8
  %add69 = fadd double %add63, %97
  %arrayidx74 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %55, i64 %indvars.iv5065
  %98 = load double, double* %arrayidx74, align 8
  %add75 = fadd double %add69, %98
  %mul76 = fmul double %add75, 2.000000e-01
  %arrayidx80 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv5567, i64 %indvars.iv5065
  store double %mul76, double* %arrayidx80, align 8
  %exitcond54 = icmp eq i64 %indvars.iv.next51, %wide.trip.count53
  br i1 %exitcond54, label %for.inc84.loopexit, label %for.body47, !llvm.loop !16

for.inc84.loopexit:                               ; preds = %for.body47
  br label %for.inc84

for.inc84:                                        ; preds = %for.inc84.loopexit, %middle.block
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv5567, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next56, %1
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond75, label %for.inc87.loopexit, label %for.cond44.preheader

for.inc87.loopexit:                               ; preds = %for.inc84
  br label %for.inc87

for.inc87:                                        ; preds = %for.inc87.loopexit, %for.cond40.preheader
  %inc88 = add nuw nsw i32 %t.070, 1
  %exitcond77 = icmp eq i32 %inc88, %tsteps
  br i1 %exitcond77, label %for.end89.loopexit, label %for.cond1.preheader

for.end89.loopexit:                               ; preds = %for.inc87
  br label %for.end89

for.end89:                                        ; preds = %for.end89.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [1300 x double]* %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %3 = sext i32 %n to i64
  %cmp14 = icmp sgt i32 %n, 0
  br i1 %cmp14, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv915 = phi i64 [ %indvars.iv.next10, %for.inc10 ], [ 0, %for.cond2.preheader.preheader ]
  %4 = mul nsw i64 %indvars.iv915, %3
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %5 = add nsw i64 %indvars.iv13, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv915, i64 %indvars.iv13
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv915, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next10, %3
  br i1 %exitcond18, label %for.end12.loopexit, label %for.cond2.preheader

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
