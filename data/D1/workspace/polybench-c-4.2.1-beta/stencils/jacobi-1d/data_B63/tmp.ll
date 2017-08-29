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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %.cast = bitcast i8* %3 to double*
  %5 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(double* %.cast, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %3 to double*
  %7 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(double* %6, double* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %8 = icmp sgt i32 %0, 42
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %2
  %10 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %10, align 1
  %11 = icmp eq i8 %strcmpload, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(double* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %2, %12
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double*, double*) unnamed_addr #2 {
  br i1 true, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %2
  br label %3

; <label>:3:                                      ; preds = %.lr.ph, %3
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %3 ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %17, %3 ]
  %4 = sitofp i32 %storemerge1 to double
  %5 = sext i32 %storemerge1 to i64
  %6 = getelementptr inbounds double, double* %0, i64 %5
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %4, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fadd <2 x double> %10, <double 2.000000e+00, double 3.000000e+00>
  %12 = fdiv <2 x double> %11, <double 2.000000e+03, double 2.000000e+03>
  %13 = extractelement <2 x double> %12, i32 0
  %14 = extractelement <2 x double> %12, i32 1
  store double %13, double* %6, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %14, double* %15, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %16 = icmp slt i64 %indvars.iv.next, 2000
  %17 = trunc i64 %indvars.iv.next to i32
  br i1 %16, label %3, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %3
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double*, double*) unnamed_addr #2 {
  br i1 true, label %._crit_edge.lr.ph, label %._crit_edge.lr.ph.split

._crit_edge.lr.ph:                                ; preds = %2
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge.lr.ph.split

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %scevgep = getelementptr double, double* %0, i64 1
  %scevgep43 = getelementptr double, double* %0, i64 1999
  %scevgep45 = getelementptr double, double* %1, i64 2000
  %scevgep63 = getelementptr double, double* %1, i64 1
  %scevgep66 = getelementptr double, double* %1, i64 1999
  %scevgep68 = getelementptr double, double* %0, i64 2000
  %bound0 = icmp ult double* %scevgep, %scevgep45
  %bound1 = icmp ugt double* %scevgep43, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  %bound070 = icmp ult double* %scevgep63, %scevgep68
  %bound171 = icmp ugt double* %scevgep66, %0
  %memcheck.conflict73 = and i1 %bound070, %bound171
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge7.us
  %3 = phi i32 [ %29, %._crit_edge7.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 false, label %scalar.ph55.preheader, label %min.iters.checked58

scalar.ph55.preheader:                            ; preds = %middle.block54, %vector.memcheck74, %min.iters.checked58, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck74 ], [ 1, %min.iters.checked58 ], [ 1, %._crit_edge.us ], [ 1997, %middle.block54 ]
  br label %scalar.ph55

min.iters.checked58:                              ; preds = %._crit_edge.us
  br i1 false, label %scalar.ph55.preheader, label %vector.memcheck74

vector.memcheck74:                                ; preds = %min.iters.checked58
  br i1 %memcheck.conflict73, label %scalar.ph55.preheader, label %vector.body53.preheader

vector.body53.preheader:                          ; preds = %vector.memcheck74
  br label %vector.body53

vector.body53:                                    ; preds = %vector.body53.preheader, %vector.body53
  %index76 = phi i64 [ %index.next77, %vector.body53 ], [ 0, %vector.body53.preheader ]
  %offset.idx81 = or i64 %index76, 1
  %4 = add nsw i64 %offset.idx81, -1
  %5 = getelementptr inbounds double, double* %0, i64 %4
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr inbounds double, double* %0, i64 %offset.idx81
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load86, %wide.load88
  %14 = fadd <2 x double> %wide.load87, %wide.load89
  %15 = add nuw nsw i64 %offset.idx81, 1
  %16 = getelementptr inbounds double, double* %0, i64 %15
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %13, %wide.load90
  %21 = fadd <2 x double> %14, %wide.load91
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = fmul <2 x double> %21, <double 3.333300e-01, double 3.333300e-01>
  %24 = getelementptr inbounds double, double* %1, i64 %offset.idx81
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> %22, <2 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> %23, <2 x double>* %27, align 8, !alias.scope !4, !noalias !1
  %index.next77 = add i64 %index76, 4
  %28 = icmp eq i64 %index.next77, 1996
  br i1 %28, label %middle.block54, label %vector.body53, !llvm.loop !6

middle.block54:                                   ; preds = %vector.body53
  br i1 false, label %.lr.ph6.us.preheader, label %scalar.ph55.preheader

._crit_edge7.us.loopexit:                         ; preds = %.lr.ph6.us
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit, %middle.block
  %29 = add nsw i32 %3, 1
  %30 = icmp slt i32 %29, 500
  br i1 %30, label %._crit_edge.us, label %._crit_edge.lr.ph.split.loopexit

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader92, %.lr.ph6.us
  %indvars.iv29 = phi i64 [ %37, %.lr.ph6.us ], [ %indvars.iv29.ph, %.lr.ph6.us.preheader92 ]
  %31 = add nsw i64 %indvars.iv29, -1
  %32 = getelementptr inbounds double, double* %1, i64 %31
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds double, double* %1, i64 %indvars.iv29
  %35 = load double, double* %34, align 8
  %36 = fadd double %33, %35
  %37 = add nuw nsw i64 %indvars.iv29, 1
  %38 = getelementptr inbounds double, double* %1, i64 %37
  %39 = load double, double* %38, align 8
  %40 = fadd double %36, %39
  %41 = fmul double %40, 3.333300e-01
  %42 = getelementptr inbounds double, double* %0, i64 %indvars.iv29
  store double %41, double* %42, align 8
  %43 = icmp slt i64 %37, 1999
  br i1 %43, label %.lr.ph6.us, label %._crit_edge7.us.loopexit, !llvm.loop !9

scalar.ph55:                                      ; preds = %scalar.ph55.preheader, %scalar.ph55
  %indvars.iv = phi i64 [ %50, %scalar.ph55 ], [ %indvars.iv.ph, %scalar.ph55.preheader ]
  %44 = add nsw i64 %indvars.iv, -1
  %45 = getelementptr inbounds double, double* %0, i64 %44
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = add nuw nsw i64 %indvars.iv, 1
  %51 = getelementptr inbounds double, double* %0, i64 %50
  %52 = load double, double* %51, align 8
  %53 = fadd double %49, %52
  %54 = fmul double %53, 3.333300e-01
  %55 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %54, double* %55, align 8
  %56 = icmp slt i64 %50, 1999
  br i1 %56, label %scalar.ph55, label %.lr.ph6.us.preheader.loopexit, !llvm.loop !10

.lr.ph6.us.preheader.loopexit:                    ; preds = %scalar.ph55
  br label %.lr.ph6.us.preheader

.lr.ph6.us.preheader:                             ; preds = %.lr.ph6.us.preheader.loopexit, %middle.block54
  br i1 false, label %.lr.ph6.us.preheader92, label %min.iters.checked

.lr.ph6.us.preheader92:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph6.us.preheader
  %indvars.iv29.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph6.us.preheader ], [ 1997, %middle.block ]
  br label %.lr.ph6.us

min.iters.checked:                                ; preds = %.lr.ph6.us.preheader
  br i1 false, label %.lr.ph6.us.preheader92, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph6.us.preheader92, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %57 = add nsw i64 %offset.idx, -1
  %58 = getelementptr inbounds double, double* %1, i64 %57
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !11
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !11
  %62 = getelementptr inbounds double, double* %1, i64 %offset.idx
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !11
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !11
  %66 = fadd <2 x double> %wide.load, %wide.load49
  %67 = fadd <2 x double> %wide.load48, %wide.load50
  %68 = add nuw nsw i64 %offset.idx, 1
  %69 = getelementptr inbounds double, double* %1, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !11
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !11
  %73 = fadd <2 x double> %66, %wide.load51
  %74 = fadd <2 x double> %67, %wide.load52
  %75 = fmul <2 x double> %73, <double 3.333300e-01, double 3.333300e-01>
  %76 = fmul <2 x double> %74, <double 3.333300e-01, double 3.333300e-01>
  %77 = getelementptr inbounds double, double* %0, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> %75, <2 x double>* %78, align 8, !alias.scope !14, !noalias !11
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %76, <2 x double>* %80, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 4
  %81 = icmp eq i64 %index.next, 1996
  br i1 %81, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 false, label %._crit_edge7.us, label %.lr.ph6.us.preheader92

._crit_edge.lr.ph.split.loopexit:                 ; preds = %._crit_edge7.us
  br label %._crit_edge.lr.ph.split

._crit_edge.lr.ph.split:                          ; preds = %._crit_edge.lr.ph.split.loopexit, %._crit_edge.lr.ph, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %1
  br label %6

; <label>:6:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %16, %._crit_edge ]
  %7 = srem i32 %storemerge1, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  %16 = trunc i64 %indvars.iv.next to i32
  br i1 %15, label %6, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %1
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
