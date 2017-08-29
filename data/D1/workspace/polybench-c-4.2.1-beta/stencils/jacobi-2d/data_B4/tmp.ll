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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %.cast = bitcast i8* %3 to [1300 x double]*
  %.cast1 = bitcast i8* %4 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %.cast, [1300 x double]* %.cast1)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %.cast, [1300 x double]* %.cast1)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %.cast)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]*, [1300 x double]*) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16, %._crit_edge.us ]
  %3 = trunc i64 %indvars.iv15 to i32
  %4 = sitofp i32 %3 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = fmul double %4, %7
  %9 = fadd double %8, 2.000000e+00
  %10 = fdiv double %9, 1.300000e+03
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  store double %10, double* %11, align 8
  %12 = add nuw nsw i64 %indvars.iv, 3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %4, %14
  %16 = fadd double %15, 3.000000e+00
  %17 = fdiv double %16, 1.300000e+03
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  store double %17, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1300
  br i1 %exitcond17, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]*, [1300 x double]*) unnamed_addr #2 {
.preheader49.lr.ph:
  br label %.preheader47.us.preheader

.preheader47.us.preheader:                        ; preds = %._crit_edge56, %.preheader49.lr.ph
  %storemerge57 = phi i32 [ 0, %.preheader49.lr.ph ], [ %88, %._crit_edge56 ]
  br label %.preheader47.us

.preheader47.us:                                  ; preds = %._crit_edge.us, %.preheader47.us.preheader
  %indvar86 = phi i64 [ %4, %._crit_edge.us ], [ 0, %.preheader47.us.preheader ]
  %indvars.iv59 = phi i64 [ %6, %._crit_edge.us ], [ 1, %.preheader47.us.preheader ]
  %4 = add i64 %indvar86, 1
  %scevgep88 = getelementptr [1300 x double], [1300 x double]* %3, i64 %4, i64 1
  %scevgep90 = getelementptr [1300 x double], [1300 x double]* %3, i64 %4, i64 1299
  %scevgep92 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar86, i64 1
  %5 = add i64 %indvar86, 2
  %scevgep94 = getelementptr [1300 x double], [1300 x double]* %2, i64 %5, i64 1299
  %6 = add nuw nsw i64 %indvars.iv59, 1
  %7 = add nsw i64 %indvars.iv59, -1
  %bound096 = icmp ult double* %scevgep88, %scevgep94
  %bound197 = icmp ult double* %scevgep92, %scevgep90
  %memcheck.conflict99 = and i1 %bound096, %bound197
  br i1 %memcheck.conflict99, label %._crit_edge.preheader, label %vector.body81.preheader

vector.body81.preheader:                          ; preds = %.preheader47.us
  br label %vector.body81

._crit_edge.preheader:                            ; preds = %.preheader47.us
  br label %._crit_edge

vector.body81:                                    ; preds = %vector.body81.preheader, %vector.body81
  %index102 = phi i64 [ %index.next103, %vector.body81 ], [ 0, %vector.body81.preheader ]
  %offset.idx106 = or i64 %index102, 1
  %8 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv59, i64 %offset.idx106
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = add nsw i64 %offset.idx106, -1
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv59, i64 %10
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load110, %wide.load111
  %14 = add nuw nsw i64 %offset.idx106, 1
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv59, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fadd <2 x double> %13, %wide.load112
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %offset.idx106
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %17, %wide.load113
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %offset.idx106
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %20, %wide.load114
  %24 = fmul <2 x double> %23, <double 2.000000e-01, double 2.000000e-01>
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv59, i64 %offset.idx106
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %24, <2 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next103 = add i64 %index102, 2
  %27 = icmp eq i64 %index.next103, 1298
  br i1 %27, label %._crit_edge.us.loopexit116, label %vector.body81, !llvm.loop !6

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %34, %._crit_edge ], [ 1, %._crit_edge.preheader ]
  %28 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv59, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = add nsw i64 %indvars.iv, -1
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv59, i64 %30
  %32 = load double, double* %31, align 8
  %33 = fadd double %29, %32
  %34 = add nuw nsw i64 %indvars.iv, 1
  %35 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv59, i64 %34
  %36 = load double, double* %35, align 8
  %37 = fadd double %33, %36
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %6, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = fadd double %37, %39
  %41 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %7, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = fmul double %43, 2.000000e-01
  %45 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv59, i64 %indvars.iv
  store double %44, double* %45, align 8
  %exitcond = icmp eq i64 %34, 1299
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %._crit_edge, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us.loopexit116:                       ; preds = %vector.body81
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit116, %._crit_edge.us.loopexit
  %exitcond61 = icmp eq i64 %6, 1299
  br i1 %exitcond61, label %.preheader.us.preheader, label %.preheader47.us

.preheader.us.preheader:                          ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge54.us
  %indvar = phi i64 [ %46, %._crit_edge54.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv65 = phi i64 [ %48, %._crit_edge54.us ], [ 1, %.preheader.us.preheader ]
  %46 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %46, i64 1
  %scevgep71 = getelementptr [1300 x double], [1300 x double]* %2, i64 %46, i64 1299
  %scevgep73 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %47 = add i64 %indvar, 2
  %scevgep75 = getelementptr [1300 x double], [1300 x double]* %3, i64 %47, i64 1299
  %48 = add nuw nsw i64 %indvars.iv65, 1
  %49 = add nsw i64 %indvars.iv65, -1
  %bound0 = icmp ult double* %scevgep, %scevgep75
  %bound1 = icmp ult double* %scevgep73, %scevgep71
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge69.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

._crit_edge69.preheader:                          ; preds = %.preheader.us
  br label %._crit_edge69

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = add nsw i64 %offset.idx, -1
  %53 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %52
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = fadd <2 x double> %wide.load, %wide.load77
  %56 = add nuw nsw i64 %offset.idx, 1
  %57 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %56
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fadd <2 x double> %55, %wide.load78
  %60 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %48, i64 %offset.idx
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !10
  %62 = fadd <2 x double> %59, %wide.load79
  %63 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %49, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fadd <2 x double> %62, %wide.load80
  %66 = fmul <2 x double> %65, <double 2.000000e-01, double 2.000000e-01>
  %67 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %offset.idx
  %68 = bitcast double* %67 to <2 x double>*
  store <2 x double> %66, <2 x double>* %68, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %69 = icmp eq i64 %index.next, 1298
  br i1 %69, label %._crit_edge54.us.loopexit115, label %vector.body, !llvm.loop !15

._crit_edge69:                                    ; preds = %._crit_edge69.preheader, %._crit_edge69
  %indvars.iv62 = phi i64 [ %76, %._crit_edge69 ], [ 1, %._crit_edge69.preheader ]
  %70 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv62
  %71 = load double, double* %70, align 8
  %72 = add nsw i64 %indvars.iv62, -1
  %73 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %72
  %74 = load double, double* %73, align 8
  %75 = fadd double %71, %74
  %76 = add nuw nsw i64 %indvars.iv62, 1
  %77 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv65, i64 %76
  %78 = load double, double* %77, align 8
  %79 = fadd double %75, %78
  %80 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %48, i64 %indvars.iv62
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  %83 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %49, i64 %indvars.iv62
  %84 = load double, double* %83, align 8
  %85 = fadd double %82, %84
  %86 = fmul double %85, 2.000000e-01
  %87 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv62
  store double %86, double* %87, align 8
  %exitcond64 = icmp eq i64 %76, 1299
  br i1 %exitcond64, label %._crit_edge54.us.loopexit, label %._crit_edge69, !llvm.loop !16

._crit_edge54.us.loopexit:                        ; preds = %._crit_edge69
  br label %._crit_edge54.us

._crit_edge54.us.loopexit115:                     ; preds = %vector.body
  br label %._crit_edge54.us

._crit_edge54.us:                                 ; preds = %._crit_edge54.us.loopexit115, %._crit_edge54.us.loopexit
  %exitcond67 = icmp eq i64 %48, 1299
  br i1 %exitcond67, label %._crit_edge56, label %.preheader.us

._crit_edge56:                                    ; preds = %._crit_edge54.us
  %88 = add nuw nsw i32 %storemerge57, 1
  %exitcond68 = icmp eq i32 %88, 500
  br i1 %exitcond68, label %._crit_edge58, label %.preheader47.us.preheader

._crit_edge58:                                    ; preds = %._crit_edge56
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv11, 1300
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge14
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge14, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1300
  br i1 %exitcond13, label %._crit_edge10, label %.preheader.us

._crit_edge10:                                    ; preds = %._crit_edge.us
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
