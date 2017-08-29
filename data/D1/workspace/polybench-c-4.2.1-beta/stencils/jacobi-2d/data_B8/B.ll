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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %5 = bitcast i8* %3 to [1300 x double]*
  %6 = bitcast i8* %4 to [1300 x double]*
  tail call fastcc void @init_array([1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d([1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [1300 x double]*
  tail call fastcc void @print_array([1300 x double]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %2 = trunc i64 %indvars.iv5 to i32
  %3 = sitofp i32 %2 to double
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %4 ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = fmul double %3, %7
  %9 = fadd double %8, 2.000000e+00
  %10 = fdiv double %9, 1.300000e+03
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  store double %10, double* %11, align 8
  %12 = add nuw nsw i64 %indvars.iv, 3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %3, %14
  %16 = fadd double %15, 3.000000e+00
  %17 = fdiv double %16, 1.300000e+03
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %17, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1300
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d([1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
.preheader6.lr.ph:
  br label %.preheader4.us.preheader

.preheader4.us.preheader:                         ; preds = %.preheader6.lr.ph, %._crit_edge13
  %.0314 = phi i32 [ 0, %.preheader6.lr.ph ], [ %116, %._crit_edge13 ]
  br label %vector.memcheck70

vector.memcheck70:                                ; preds = %.preheader4.us.preheader, %._crit_edge.us
  %indvar56 = phi i64 [ %indvar.next57, %._crit_edge.us ], [ 0, %.preheader4.us.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us ], [ 1, %.preheader4.us.preheader ]
  %2 = add i64 %indvar56, 1
  %scevgep58 = getelementptr [1300 x double], [1300 x double]* %1, i64 %2, i64 1
  %scevgep60 = getelementptr [1300 x double], [1300 x double]* %1, i64 %2, i64 1299
  %scevgep62 = getelementptr [1300 x double], [1300 x double]* %0, i64 %indvar56, i64 1
  %3 = add i64 %indvar56, 2
  %scevgep64 = getelementptr [1300 x double], [1300 x double]* %0, i64 %3, i64 1299
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %4 = add nsw i64 %indvars.iv16, -1
  %bound066 = icmp ult double* %scevgep58, %scevgep64
  %bound167 = icmp ult double* %scevgep62, %scevgep60
  %memcheck.conflict69 = and i1 %bound066, %bound167
  br i1 %memcheck.conflict69, label %scalar.ph49.preheader, label %vector.body47.preheader

vector.body47.preheader:                          ; preds = %vector.memcheck70
  br label %vector.body47

vector.body47:                                    ; preds = %vector.body47.preheader, %vector.body47
  %index72 = phi i64 [ %index.next73, %vector.body47 ], [ 0, %vector.body47.preheader ]
  %offset.idx77 = or i64 %index72, 1
  %5 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv16, i64 %offset.idx77
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = add nsw i64 %offset.idx77, -1
  %10 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv16, i64 %9
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load82, %wide.load84
  %15 = fadd <2 x double> %wide.load83, %wide.load85
  %16 = add nuw nsw i64 %offset.idx77, 1
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv16, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %14, %wide.load86
  %22 = fadd <2 x double> %15, %wide.load87
  %23 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv.next17, i64 %offset.idx77
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %21, %wide.load88
  %28 = fadd <2 x double> %22, %wide.load89
  %29 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %4, i64 %offset.idx77
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %27, %wide.load90
  %34 = fadd <2 x double> %28, %wide.load91
  %35 = fmul <2 x double> %33, <double 2.000000e-01, double 2.000000e-01>
  %36 = fmul <2 x double> %34, <double 2.000000e-01, double 2.000000e-01>
  %37 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv16, i64 %offset.idx77
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %35, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %36, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next73 = add i64 %index72, 4
  %41 = icmp eq i64 %index.next73, 1296
  br i1 %41, label %middle.block48, label %vector.body47, !llvm.loop !6

middle.block48:                                   ; preds = %vector.body47
  br label %scalar.ph49.preheader

scalar.ph49.preheader:                            ; preds = %middle.block48, %vector.memcheck70
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck70 ], [ 1297, %middle.block48 ]
  br label %scalar.ph49

scalar.ph49:                                      ; preds = %scalar.ph49.preheader, %scalar.ph49
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph49 ], [ %indvars.iv.ph, %scalar.ph49.preheader ]
  %42 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = add nsw i64 %indvars.iv, -1
  %45 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv16, i64 %44
  %46 = load double, double* %45, align 8
  %47 = fadd double %43, %46
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv.next17, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %4, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = fmul double %56, 2.000000e-01
  %58 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  store double %57, double* %58, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %._crit_edge.us, label %scalar.ph49, !llvm.loop !9

._crit_edge.us:                                   ; preds = %scalar.ph49
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1299
  %indvar.next57 = add i64 %indvar56, 1
  br i1 %exitcond19, label %.preheader.us.preheader, label %vector.memcheck70

.preheader.us.preheader:                          ; preds = %._crit_edge.us
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge11.us ], [ 1, %.preheader.us.preheader ]
  %59 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %0, i64 %59, i64 1
  %scevgep31 = getelementptr [1300 x double], [1300 x double]* %0, i64 %59, i64 1299
  %scevgep33 = getelementptr [1300 x double], [1300 x double]* %1, i64 %indvar, i64 1
  %60 = add i64 %indvar, 2
  %scevgep35 = getelementptr [1300 x double], [1300 x double]* %1, i64 %60, i64 1299
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %61 = add nsw i64 %indvars.iv24, -1
  %bound0 = icmp ult double* %scevgep, %scevgep35
  %bound1 = icmp ult double* %scevgep33, %scevgep31
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv24, i64 %offset.idx
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !10
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = add nsw i64 %offset.idx, -1
  %67 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv24, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = fadd <2 x double> %wide.load, %wide.load39
  %72 = fadd <2 x double> %wide.load38, %wide.load40
  %73 = add nuw nsw i64 %offset.idx, 1
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv24, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fadd <2 x double> %71, %wide.load41
  %79 = fadd <2 x double> %72, %wide.load42
  %80 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv.next25, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = fadd <2 x double> %78, %wide.load43
  %85 = fadd <2 x double> %79, %wide.load44
  %86 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %61, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %84, %wide.load45
  %91 = fadd <2 x double> %85, %wide.load46
  %92 = fmul <2 x double> %90, <double 2.000000e-01, double 2.000000e-01>
  %93 = fmul <2 x double> %91, <double 2.000000e-01, double 2.000000e-01>
  %94 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv24, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  store <2 x double> %92, <2 x double>* %95, align 8, !alias.scope !13, !noalias !10
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x double>*
  store <2 x double> %93, <2 x double>* %97, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %98 = icmp eq i64 %index.next, 1296
  br i1 %98, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck
  %indvars.iv20.ph = phi i64 [ 1, %vector.memcheck ], [ 1297, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %scalar.ph ], [ %indvars.iv20.ph, %scalar.ph.preheader ]
  %99 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv24, i64 %indvars.iv20
  %100 = load double, double* %99, align 8
  %101 = add nsw i64 %indvars.iv20, -1
  %102 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv24, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fadd double %100, %103
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %105 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv24, i64 %indvars.iv.next21
  %106 = load double, double* %105, align 8
  %107 = fadd double %104, %106
  %108 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv.next25, i64 %indvars.iv20
  %109 = load double, double* %108, align 8
  %110 = fadd double %107, %109
  %111 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %61, i64 %indvars.iv20
  %112 = load double, double* %111, align 8
  %113 = fadd double %110, %112
  %114 = fmul double %113, 2.000000e-01
  %115 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv20
  store double %114, double* %115, align 8
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 1299
  br i1 %exitcond23, label %._crit_edge11.us, label %scalar.ph, !llvm.loop !16

._crit_edge11.us:                                 ; preds = %scalar.ph
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1299
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond27, label %._crit_edge13, label %vector.memcheck

._crit_edge13:                                    ; preds = %._crit_edge11.us
  %116 = add nuw nsw i32 %.0314, 1
  %exitcond28 = icmp eq i32 %116, 500
  br i1 %exitcond28, label %._crit_edge15, label %.preheader4.us.preheader

._crit_edge15:                                    ; preds = %._crit_edge13
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1300 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv5, 1300
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1300
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
