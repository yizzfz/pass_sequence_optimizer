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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to double*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double*, double*) unnamed_addr #2 {
vector.memcheck:
  %scevgep = getelementptr double, double* %0, i64 2000
  %scevgep2 = getelementptr double, double* %1, i64 2000
  %bound0 = icmp ugt double* %scevgep2, %0
  %bound1 = icmp ugt double* %scevgep, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.ind4 = phi <2 x i32> [ %vec.ind.next5, %vector.body ], [ <i32 0, i32 1>, %vector.body.preheader ]
  %2 = sitofp <2 x i32> %vec.ind4 to <2 x double>
  %3 = fadd <2 x double> %2, <double 2.000000e+00, double 2.000000e+00>
  %4 = fdiv <2 x double> %3, <double 2.000000e+03, double 2.000000e+03>
  %5 = getelementptr inbounds double, double* %0, i64 %index
  %6 = bitcast double* %5 to <2 x double>*
  store <2 x double> %4, <2 x double>* %6, align 8, !alias.scope !1, !noalias !4
  %7 = fadd <2 x double> %2, <double 3.000000e+00, double 3.000000e+00>
  %8 = fdiv <2 x double> %7, <double 2.000000e+03, double 2.000000e+03>
  %9 = getelementptr inbounds double, double* %1, i64 %index
  %10 = bitcast double* %9 to <2 x double>*
  store <2 x double> %8, <2 x double>* %10, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next5 = add <2 x i32> %vec.ind4, <i32 2, i32 2>
  %11 = icmp eq i64 %index.next, 2000
  br i1 %11, label %middle.block.loopexit6, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %12 = trunc i64 %indvars.iv to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %15 = insertelement <2 x double> undef, double %13, i32 0
  %16 = insertelement <2 x double> %15, double %13, i32 1
  %17 = fadd <2 x double> %16, <double 2.000000e+00, double 3.000000e+00>
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = extractelement <2 x double> %18, i32 0
  %20 = extractelement <2 x double> %18, i32 1
  store double %19, double* %14, align 8
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %22 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %22, label %scalar.ph, label %middle.block.loopexit, !llvm.loop !9

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit6:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit6, %middle.block.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double*, double*) unnamed_addr #2 {
._crit_edge.lr.ph:
  %scevgep = getelementptr double, double* %0, i64 1
  %scevgep36 = getelementptr double, double* %0, i64 1999
  %scevgep38 = getelementptr double, double* %1, i64 2000
  %scevgep51 = getelementptr double, double* %1, i64 1
  %scevgep53 = getelementptr double, double* %1, i64 1999
  %scevgep55 = getelementptr double, double* %0, i64 2000
  %bound057 = icmp ult double* %scevgep51, %scevgep55
  %bound158 = icmp ugt double* %scevgep53, %0
  %memcheck.conflict60 = and i1 %bound057, %bound158
  %bound0 = icmp ult double* %scevgep, %scevgep38
  %bound1 = icmp ugt double* %scevgep36, %1
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %vector.memcheck61

vector.memcheck61:                                ; preds = %._crit_edge.lr.ph, %._crit_edge5.us
  %2 = phi i32 [ %28, %._crit_edge5.us ], [ 0, %._crit_edge.lr.ph ]
  br i1 %memcheck.conflict60, label %scalar.ph48.preheader, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %vector.memcheck61
  br label %vector.body46

scalar.ph48.preheader.loopexit:                   ; preds = %vector.body46
  br label %scalar.ph48.preheader

scalar.ph48.preheader:                            ; preds = %scalar.ph48.preheader.loopexit, %vector.memcheck61
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck61 ], [ 1997, %scalar.ph48.preheader.loopexit ]
  br label %scalar.ph48

vector.body46:                                    ; preds = %vector.body46.preheader, %vector.body46
  %index63 = phi i64 [ %index.next64, %vector.body46 ], [ 0, %vector.body46.preheader ]
  %offset.idx67 = or i64 %index63, 1
  %3 = add nsw i64 %offset.idx67, -1
  %4 = getelementptr inbounds double, double* %0, i64 %3
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !10
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !10
  %8 = getelementptr inbounds double, double* %0, i64 %offset.idx67
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !10
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !10
  %12 = fadd <2 x double> %wide.load72, %wide.load74
  %13 = fadd <2 x double> %wide.load73, %wide.load75
  %14 = add nuw nsw i64 %offset.idx67, 1
  %15 = getelementptr inbounds double, double* %0, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !10
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !10
  %19 = fadd <2 x double> %12, %wide.load76
  %20 = fadd <2 x double> %13, %wide.load77
  %21 = fmul <2 x double> %19, <double 3.333300e-01, double 3.333300e-01>
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = getelementptr inbounds double, double* %1, i64 %offset.idx67
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> %21, <2 x double>* %24, align 8, !alias.scope !13, !noalias !10
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %22, <2 x double>* %26, align 8, !alias.scope !13, !noalias !10
  %index.next64 = add i64 %index63, 4
  %27 = icmp eq i64 %index.next64, 1996
  br i1 %27, label %scalar.ph48.preheader.loopexit, label %vector.body46, !llvm.loop !15

._crit_edge5.us:                                  ; preds = %.lr.ph4.us
  %28 = add nsw i32 %2, 1
  %29 = icmp slt i32 %28, 500
  br i1 %29, label %vector.memcheck61, label %.loopexit

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.preheader, %.lr.ph4.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %.lr.ph4.us ], [ %indvars.iv25.ph, %.lr.ph4.us.preheader ]
  %30 = add nsw i64 %indvars.iv25, -1
  %31 = getelementptr inbounds double, double* %1, i64 %30
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %1, i64 %indvars.iv25
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %36 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next26
  %37 = load double, double* %36, align 8
  %38 = fadd double %35, %37
  %39 = fmul double %38, 3.333300e-01
  %40 = getelementptr inbounds double, double* %0, i64 %indvars.iv25
  store double %39, double* %40, align 8
  %41 = icmp slt i64 %indvars.iv.next26, 1999
  br i1 %41, label %.lr.ph4.us, label %._crit_edge5.us, !llvm.loop !16

scalar.ph48:                                      ; preds = %scalar.ph48.preheader, %scalar.ph48
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph48 ], [ %indvars.iv.ph, %scalar.ph48.preheader ]
  %42 = add nsw i64 %indvars.iv, -1
  %43 = getelementptr inbounds double, double* %0, i64 %42
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fadd double %44, %46
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = fmul double %50, 3.333300e-01
  %52 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %51, double* %52, align 8
  %53 = icmp slt i64 %indvars.iv.next, 1999
  br i1 %53, label %scalar.ph48, label %vector.memcheck, !llvm.loop !17

vector.memcheck:                                  ; preds = %scalar.ph48
  br i1 %memcheck.conflict, label %.lr.ph4.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.lr.ph4.us.preheader.loopexit:                    ; preds = %vector.body
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %vector.memcheck
  %indvars.iv25.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %.lr.ph4.us.preheader.loopexit ]
  br label %.lr.ph4.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %54 = add nsw i64 %offset.idx, -1
  %55 = getelementptr inbounds double, double* %1, i64 %54
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !18
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !18
  %59 = getelementptr inbounds double, double* %1, i64 %offset.idx
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !18
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !18
  %63 = fadd <2 x double> %wide.load, %wide.load42
  %64 = fadd <2 x double> %wide.load41, %wide.load43
  %65 = add nuw nsw i64 %offset.idx, 1
  %66 = getelementptr inbounds double, double* %1, i64 %65
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !18
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !18
  %70 = fadd <2 x double> %63, %wide.load44
  %71 = fadd <2 x double> %64, %wide.load45
  %72 = fmul <2 x double> %70, <double 3.333300e-01, double 3.333300e-01>
  %73 = fmul <2 x double> %71, <double 3.333300e-01, double 3.333300e-01>
  %74 = getelementptr inbounds double, double* %0, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> %72, <2 x double>* %75, align 8, !alias.scope !21, !noalias !18
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  store <2 x double> %73, <2 x double>* %77, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, 1996
  br i1 %78, label %.lr.ph4.us.preheader.loopexit, label %vector.body, !llvm.loop !23

.loopexit:                                        ; preds = %._crit_edge5.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %5

; <label>:5:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %5, label %.loopexit

.loopexit:                                        ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}
