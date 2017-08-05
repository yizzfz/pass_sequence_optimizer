; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next.1, %for.body ]
  %0 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %2 to double
  %arrayidx.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %3 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1.1 = extractelement <2 x double> %div.1, i32 0
  %div.v.r2.1 = extractelement <2 x double> %div.1, i32 1
  store double %div.v.r1.1, double* %arrayidx.1, align 8
  %arrayidx7.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %div.v.r2.1, double* %arrayidx7.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp.1 = icmp slt i64 %indvars.iv.next.1, 2000
  br i1 %cmp.1, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.body.lr.ph, label %entry.for.end35_crit_edge

entry.for.end35_crit_edge:                        ; preds = %entry
  br label %for.end35

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.body.lr.ph.for.end35_crit_edge

for.body.lr.ph.for.end35_crit_edge:               ; preds = %for.body.lr.ph
  br label %for.end35

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %scevgep86 = getelementptr double, double* %A, i64 1
  %scevgep89 = getelementptr double, double* %A, i64 1999
  %scevgep91 = getelementptr double, double* %B, i64 2000
  %scevgep125 = getelementptr double, double* %B, i64 1
  %scevgep128 = getelementptr double, double* %B, i64 1999
  %scevgep130 = getelementptr double, double* %A, i64 2000
  %bound093 = icmp ult double* %scevgep86, %scevgep91
  %bound194 = icmp ugt double* %scevgep89, %B
  %found.conflict95 = and i1 %bound093, %bound194
  %bound0132 = icmp ult double* %scevgep125, %scevgep130
  %bound1133 = icmp ugt double* %scevgep128, %A
  %found.conflict134 = and i1 %bound0132, %bound1133
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.inc33.us
  %inc3414.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.body.us.preheader ]
  br i1 false, label %for.body.us.for.body3.us.preheader_crit_edge, label %min.iters.checked120

for.body.us.for.body3.us.preheader_crit_edge:     ; preds = %for.body.us
  br label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %min.iters.checked120.for.body3.us.preheader_crit_edge, %for.body.us.for.body3.us.preheader_crit_edge, %middle.block116, %vector.memcheck136
  %indvars.iv.us.ph = phi i64 [ 1, %vector.memcheck136 ], [ undef, %min.iters.checked120.for.body3.us.preheader_crit_edge ], [ undef, %for.body.us.for.body3.us.preheader_crit_edge ], [ 1997, %middle.block116 ]
  br label %for.body3.us

min.iters.checked120:                             ; preds = %for.body.us
  br i1 false, label %min.iters.checked120.for.body3.us.preheader_crit_edge, label %vector.memcheck136

min.iters.checked120.for.body3.us.preheader_crit_edge: ; preds = %min.iters.checked120
  br label %for.body3.us.preheader

vector.memcheck136:                               ; preds = %min.iters.checked120
  br i1 %found.conflict134, label %for.body3.us.preheader, label %vector.body115.preheader

vector.body115.preheader:                         ; preds = %vector.memcheck136
  br label %vector.body115

vector.body115:                                   ; preds = %vector.body115.preheader, %vector.body115
  %index138 = phi i64 [ %index.next139, %vector.body115 ], [ 0, %vector.body115.preheader ]
  %offset.idx143 = or i64 %index138, 1
  %0 = getelementptr inbounds double, double* %A, i64 %index138
  %1 = bitcast double* %0 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %1, align 8, !alias.scope !1
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %3, align 8, !alias.scope !1
  %4 = getelementptr inbounds double, double* %A, i64 %offset.idx143
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = fadd <2 x double> %wide.load148, %wide.load150
  %9 = fadd <2 x double> %wide.load149, %wide.load151
  %10 = add nuw nsw i64 %offset.idx143, 1
  %11 = getelementptr inbounds double, double* %A, i64 %10
  %12 = getelementptr double, double* %11, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %8, %wide.load149
  %15 = fadd <2 x double> %9, %wide.load153
  %16 = fmul <2 x double> %14, <double 3.333300e-01, double 3.333300e-01>
  %17 = fmul <2 x double> %15, <double 3.333300e-01, double 3.333300e-01>
  %18 = getelementptr inbounds double, double* %B, i64 %offset.idx143
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> %16, <2 x double>* %19, align 8, !alias.scope !4, !noalias !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> %17, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next139 = add i64 %index138, 4
  %22 = icmp eq i64 %index.next139, 1996
  br i1 %22, label %middle.block116, label %vector.body115, !llvm.loop !6

middle.block116:                                  ; preds = %vector.body115
  br i1 false, label %middle.block116.for.body16.us.preheader_crit_edge, label %for.body3.us.preheader

middle.block116.for.body16.us.preheader_crit_edge: ; preds = %middle.block116
  br label %for.body16.us.preheader

for.inc33.us.loopexit:                            ; preds = %for.body16.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %middle.block77.for.inc33.us_crit_edge, %for.inc33.us.loopexit
  %inc34.us = add nsw i32 %inc3414.us, 1
  %cmp.us = icmp slt i32 %inc34.us, 500
  br i1 %cmp.us, label %for.body.us, label %for.end35.loopexit

for.body16.us:                                    ; preds = %for.body16.us.preheader154, %for.body16.us
  %indvars.iv10.us = phi i64 [ %add23.us, %for.body16.us ], [ %indvars.iv10.us.ph, %for.body16.us.preheader154 ]
  %sub17.us = add nsw i64 %indvars.iv10.us, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %sub17.us
  %23 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv10.us
  %24 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %23, %24
  %add23.us = add nuw nsw i64 %indvars.iv10.us, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %add23.us
  %25 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %25
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv10.us
  store double %mul27.us, double* %arrayidx29.us, align 8
  %cmp15.us = icmp slt i64 %add23.us, 1999
  br i1 %cmp15.us, label %for.body16.us, label %for.inc33.us.loopexit, !llvm.loop !9

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv.us = phi i64 [ %add7.us, %for.body3.us ], [ %indvars.iv.us.ph, %for.body3.us.preheader ]
  %sub4.us = add nsw i64 %indvars.iv.us, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %sub4.us
  %26 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.us
  %27 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %26, %27
  %add7.us = add nuw nsw i64 %indvars.iv.us, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %add7.us
  %28 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %28
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.us
  store double %mul.us, double* %arrayidx12.us, align 8
  %cmp2.us = icmp slt i64 %add7.us, 1999
  br i1 %cmp2.us, label %for.body3.us, label %for.body16.us.preheader.loopexit, !llvm.loop !10

for.body16.us.preheader.loopexit:                 ; preds = %for.body3.us
  br label %for.body16.us.preheader

for.body16.us.preheader:                          ; preds = %middle.block116.for.body16.us.preheader_crit_edge, %for.body16.us.preheader.loopexit
  br i1 false, label %for.body16.us.preheader.for.body16.us.preheader154_crit_edge, label %min.iters.checked81

for.body16.us.preheader.for.body16.us.preheader154_crit_edge: ; preds = %for.body16.us.preheader
  br label %for.body16.us.preheader154

for.body16.us.preheader154:                       ; preds = %min.iters.checked81.for.body16.us.preheader154_crit_edge, %for.body16.us.preheader.for.body16.us.preheader154_crit_edge, %middle.block77, %vector.memcheck97
  %indvars.iv10.us.ph = phi i64 [ 1, %vector.memcheck97 ], [ undef, %min.iters.checked81.for.body16.us.preheader154_crit_edge ], [ undef, %for.body16.us.preheader.for.body16.us.preheader154_crit_edge ], [ 1997, %middle.block77 ]
  br label %for.body16.us

min.iters.checked81:                              ; preds = %for.body16.us.preheader
  br i1 false, label %min.iters.checked81.for.body16.us.preheader154_crit_edge, label %vector.memcheck97

min.iters.checked81.for.body16.us.preheader154_crit_edge: ; preds = %min.iters.checked81
  br label %for.body16.us.preheader154

vector.memcheck97:                                ; preds = %min.iters.checked81
  br i1 %found.conflict95, label %for.body16.us.preheader154, label %vector.body76.preheader

vector.body76.preheader:                          ; preds = %vector.memcheck97
  br label %vector.body76

vector.body76:                                    ; preds = %vector.body76.preheader, %vector.body76
  %index99 = phi i64 [ %index.next100, %vector.body76 ], [ 0, %vector.body76.preheader ]
  %offset.idx104 = or i64 %index99, 1
  %29 = getelementptr inbounds double, double* %B, i64 %index99
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !11
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !11
  %33 = getelementptr inbounds double, double* %B, i64 %offset.idx104
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !11
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !11
  %37 = fadd <2 x double> %wide.load109, %wide.load111
  %38 = fadd <2 x double> %wide.load110, %wide.load112
  %39 = add nuw nsw i64 %offset.idx104, 1
  %40 = getelementptr inbounds double, double* %B, i64 %39
  %41 = getelementptr double, double* %40, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !11
  %43 = fadd <2 x double> %37, %wide.load110
  %44 = fadd <2 x double> %38, %wide.load114
  %45 = fmul <2 x double> %43, <double 3.333300e-01, double 3.333300e-01>
  %46 = fmul <2 x double> %44, <double 3.333300e-01, double 3.333300e-01>
  %47 = getelementptr inbounds double, double* %A, i64 %offset.idx104
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %45, <2 x double>* %48, align 8, !alias.scope !14, !noalias !11
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %46, <2 x double>* %50, align 8, !alias.scope !14, !noalias !11
  %index.next100 = add i64 %index99, 4
  %51 = icmp eq i64 %index.next100, 1996
  br i1 %51, label %middle.block77, label %vector.body76, !llvm.loop !16

middle.block77:                                   ; preds = %vector.body76
  br i1 false, label %middle.block77.for.inc33.us_crit_edge, label %for.body16.us.preheader154

middle.block77.for.inc33.us_crit_edge:            ; preds = %middle.block77
  br label %for.inc33.us

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35:                                        ; preds = %for.body.lr.ph.for.end35_crit_edge, %entry.for.end35_crit_edge, %for.end35.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %if.end
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2000
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
