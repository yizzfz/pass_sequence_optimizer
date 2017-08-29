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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %5 = bitcast i8* %3 to [1300 x double]*
  %6 = bitcast i8* %4 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader.lr.ph, label %.loopexit5

.preheader.lr.ph:                                 ; preds = %3
  %5 = sitofp i32 %0 to double
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %.loopexit.us ], [ 0, %.preheader.lr.ph ]
  %6 = trunc i64 %indvars.iv6 to i32
  %7 = sitofp i32 %6 to double
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %8 ], [ 0, %.preheader.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %7, %11
  %13 = fadd double %12, 2.000000e+00
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  store double %14, double* %15, align 8
  %16 = add nuw nsw i64 %indvars.iv, 3
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fmul double %7, %18
  %20 = fadd double %19, 3.000000e+00
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.us, label %8

.loopexit.us:                                     ; preds = %8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count
  br i1 %exitcond9, label %.loopexit5.loopexit, label %.preheader.us

.loopexit5.loopexit:                              ; preds = %.loopexit.us
  br label %.loopexit5

.loopexit5:                                       ; preds = %.loopexit5.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader6.lr.ph, label %.loopexit18

.preheader6.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %wide.trip.count29 = zext i32 %6 to i64
  %8 = add nsw i64 %wide.trip.count29, -1
  %min.iters.check52 = icmp ult i64 %8, 4
  %n.vec55 = and i64 %8, -4
  %cmp.zero56 = icmp eq i64 %n.vec55, 0
  %ind.end77 = or i64 %n.vec55, 1
  %cmp.n78 = icmp eq i64 %8, %n.vec55
  %min.iters.check = icmp ult i64 %8, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %8, %n.vec
  br label %.preheader6

.preheader6:                                      ; preds = %.loopexit17, %.preheader6.lr.ph
  %.0314 = phi i32 [ 0, %.preheader6.lr.ph ], [ %123, %.loopexit17 ]
  br i1 %7, label %.preheader4.us.preheader, label %.loopexit17

.preheader4.us.preheader:                         ; preds = %.preheader6
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %.loopexit16.us
  %indvar58 = phi i64 [ %indvar.next59, %.loopexit16.us ], [ 0, %.preheader4.us.preheader ]
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.loopexit16.us ], [ 1, %.preheader4.us.preheader ]
  %9 = add nuw nsw i64 %indvar58, 1
  %scevgep60 = getelementptr [1300 x double], [1300 x double]* %3, i64 %9, i64 1
  %scevgep62 = getelementptr [1300 x double], [1300 x double]* %3, i64 %9, i64 %wide.trip.count29
  %scevgep64 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar58, i64 1
  %10 = add nuw nsw i64 %indvar58, 2
  %scevgep66 = getelementptr [1300 x double], [1300 x double]* %2, i64 %10, i64 %wide.trip.count29
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %11 = add nsw i64 %indvars.iv19, -1
  br i1 %min.iters.check52, label %scalar.ph51.preheader, label %min.iters.checked53

min.iters.checked53:                              ; preds = %.preheader4.us
  br i1 %cmp.zero56, label %scalar.ph51.preheader, label %vector.memcheck72

vector.memcheck72:                                ; preds = %min.iters.checked53
  %bound068 = icmp ult double* %scevgep60, %scevgep66
  %bound169 = icmp ult double* %scevgep64, %scevgep62
  %memcheck.conflict71 = and i1 %bound068, %bound169
  br i1 %memcheck.conflict71, label %scalar.ph51.preheader, label %vector.body49.preheader

vector.body49.preheader:                          ; preds = %vector.memcheck72
  br label %vector.body49

vector.body49:                                    ; preds = %vector.body49.preheader, %vector.body49
  %index74 = phi i64 [ %index.next75, %vector.body49 ], [ 0, %vector.body49.preheader ]
  %offset.idx79 = or i64 %index74, 1
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv19, i64 %offset.idx79
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = add nsw i64 %offset.idx79, -1
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv19, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %wide.load84, %wide.load86
  %22 = fadd <2 x double> %wide.load85, %wide.load87
  %23 = add nuw nsw i64 %offset.idx79, 1
  %24 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv19, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %21, %wide.load88
  %29 = fadd <2 x double> %22, %wide.load89
  %30 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next20, i64 %offset.idx79
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %28, %wide.load90
  %35 = fadd <2 x double> %29, %wide.load91
  %36 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %11, i64 %offset.idx79
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !1
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = fadd <2 x double> %34, %wide.load92
  %41 = fadd <2 x double> %35, %wide.load93
  %42 = fmul <2 x double> %40, <double 2.000000e-01, double 2.000000e-01>
  %43 = fmul <2 x double> %41, <double 2.000000e-01, double 2.000000e-01>
  %44 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv19, i64 %offset.idx79
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> %42, <2 x double>* %45, align 8, !alias.scope !4, !noalias !1
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> %43, <2 x double>* %47, align 8, !alias.scope !4, !noalias !1
  %index.next75 = add i64 %index74, 4
  %48 = icmp eq i64 %index.next75, %n.vec55
  br i1 %48, label %middle.block50, label %vector.body49, !llvm.loop !6

middle.block50:                                   ; preds = %vector.body49
  br i1 %cmp.n78, label %.loopexit16.us, label %scalar.ph51.preheader

scalar.ph51.preheader:                            ; preds = %middle.block50, %vector.memcheck72, %min.iters.checked53, %.preheader4.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck72 ], [ 1, %min.iters.checked53 ], [ 1, %.preheader4.us ], [ %ind.end77, %middle.block50 ]
  br label %scalar.ph51

scalar.ph51:                                      ; preds = %scalar.ph51.preheader, %scalar.ph51
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph51 ], [ %indvars.iv.ph, %scalar.ph51.preheader ]
  %49 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = add nsw i64 %indvars.iv, -1
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv19, i64 %51
  %53 = load double, double* %52, align 8
  %54 = fadd double %50, %53
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv.next
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next20, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %11, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = fmul double %63, 2.000000e-01
  %65 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv
  store double %64, double* %65, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count29
  br i1 %exitcond, label %.loopexit16.us.loopexit, label %scalar.ph51, !llvm.loop !9

.loopexit16.us.loopexit:                          ; preds = %scalar.ph51
  br label %.loopexit16.us

.loopexit16.us:                                   ; preds = %.loopexit16.us.loopexit, %middle.block50
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count29
  %indvar.next59 = add nuw nsw i64 %indvar58, 1
  br i1 %exitcond22, label %.preheader5, label %.preheader4.us

.preheader5:                                      ; preds = %.loopexit16.us
  br i1 %7, label %.preheader.us.preheader, label %.loopexit17

.preheader.us.preheader:                          ; preds = %.preheader5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit.us
  %indvar = phi i64 [ %indvar.next, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %.loopexit.us ], [ 1, %.preheader.us.preheader ]
  %66 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %66, i64 1
  %scevgep33 = getelementptr [1300 x double], [1300 x double]* %2, i64 %66, i64 %wide.trip.count29
  %scevgep35 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %67 = add nuw nsw i64 %indvar, 2
  %scevgep37 = getelementptr [1300 x double], [1300 x double]* %3, i64 %67, i64 %wide.trip.count29
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %68 = add nsw i64 %indvars.iv27, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep37
  %bound1 = icmp ult double* %scevgep35, %scevgep33
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv27, i64 %offset.idx
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = add nsw i64 %offset.idx, -1
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv27, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fadd <2 x double> %wide.load, %wide.load41
  %79 = fadd <2 x double> %wide.load40, %wide.load42
  %80 = add nuw nsw i64 %offset.idx, 1
  %81 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv27, i64 %80
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fadd <2 x double> %78, %wide.load43
  %86 = fadd <2 x double> %79, %wide.load44
  %87 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next28, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %85, %wide.load45
  %92 = fadd <2 x double> %86, %wide.load46
  %93 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %68, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fadd <2 x double> %91, %wide.load47
  %98 = fadd <2 x double> %92, %wide.load48
  %99 = fmul <2 x double> %97, <double 2.000000e-01, double 2.000000e-01>
  %100 = fmul <2 x double> %98, <double 2.000000e-01, double 2.000000e-01>
  %101 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv27, i64 %offset.idx
  %102 = bitcast double* %101 to <2 x double>*
  store <2 x double> %99, <2 x double>* %102, align 8, !alias.scope !13, !noalias !10
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x double>*
  store <2 x double> %100, <2 x double>* %104, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %105 = icmp eq i64 %index.next, %n.vec
  br i1 %105, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.loopexit.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv23.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %scalar.ph ], [ %indvars.iv23.ph, %scalar.ph.preheader ]
  %106 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv23
  %107 = load double, double* %106, align 8
  %108 = add nsw i64 %indvars.iv23, -1
  %109 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv27, i64 %108
  %110 = load double, double* %109, align 8
  %111 = fadd double %107, %110
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %112 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv27, i64 %indvars.iv.next24
  %113 = load double, double* %112, align 8
  %114 = fadd double %111, %113
  %115 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next28, i64 %indvars.iv23
  %116 = load double, double* %115, align 8
  %117 = fadd double %114, %116
  %118 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %68, i64 %indvars.iv23
  %119 = load double, double* %118, align 8
  %120 = fadd double %117, %119
  %121 = fmul double %120, 2.000000e-01
  %122 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv23
  store double %121, double* %122, align 8
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count29
  br i1 %exitcond26, label %.loopexit.us.loopexit, label %scalar.ph, !llvm.loop !16

.loopexit.us.loopexit:                            ; preds = %scalar.ph
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit, %middle.block
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond30, label %.loopexit17.loopexit, label %.preheader.us

.loopexit17.loopexit:                             ; preds = %.loopexit.us
  br label %.loopexit17

.loopexit17:                                      ; preds = %.loopexit17.loopexit, %.preheader6, %.preheader5
  %123 = add nuw nsw i32 %.0314, 1
  %exitcond31 = icmp eq i32 %123, %0
  br i1 %exitcond31, label %.loopexit18.loopexit, label %.preheader6

.loopexit18.loopexit:                             ; preds = %.loopexit17
  br label %.loopexit18

.loopexit18:                                      ; preds = %.loopexit18.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %.loopexit5

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %.loopexit.us ]
  %9 = mul nsw i64 %indvars.iv6, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %17 ], [ 0, %.preheader.us ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.loopexit.us, label %10

.loopexit.us:                                     ; preds = %17
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count
  br i1 %exitcond9, label %.loopexit5.loopexit, label %.preheader.us

.loopexit5.loopexit:                              ; preds = %.loopexit.us
  br label %.loopexit5

.loopexit5:                                       ; preds = %.loopexit5.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
