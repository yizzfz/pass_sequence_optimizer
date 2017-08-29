; ModuleID = 'A.ll'
source_filename = "lu.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %10

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %10

; <label>:10:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %._crit_edge, %2
  %indvars.iv4565 = phi i64 [ 0, %2 ], [ %indvars.iv.next46, %._crit_edge ]
  %indvars.iv5164 = phi i64 [ 1, %2 ], [ %indvars.iv.next52, %._crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv4565, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %4
  %scevgep68 = bitcast double* %scevgep to i8*
  %5 = mul nsw i64 %indvars.iv4565, -8
  %6 = add nsw i64 %5, 15992
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %.preheader6
  %indvars.iv3061 = phi i64 [ 0, %.preheader6.preheader ], [ %indvars.iv.next31, %.preheader6 ]
  %7 = sub nsw i64 0, %indvars.iv3061
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4565, i64 %indvars.iv3061
  store double %12, double* %13, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3061, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next31, %indvars.iv5164
  br i1 %exitcond35, label %14, label %.preheader6

; <label>:14:                                     ; preds = %.preheader6
  %exitcond5062 = icmp eq i64 %indvars.iv5164, 2000
  br i1 %exitcond5062, label %._crit_edge, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %14
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep68, i8 0, i64 %6, i32 8, i1 false)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %14
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4565, 1
  %15 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv4565, i64 %indvars.iv4565
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv5164, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond53, label %.preheader3.preheader.preheader, label %.preheader6.preheader

.preheader3.preheader.preheader:                  ; preds = %._crit_edge
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 32000000, i32 8, i1 false)
  %17 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3.preheader.preheader, %.preheader4
  %indvars.iv2258 = phi i64 [ %indvars.iv.next23, %.preheader4 ], [ 0, %.preheader3.preheader.preheader ]
  br label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %.preheader3.preheader, %.preheader3
  %indvars.iv1857 = phi i64 [ 0, %.preheader3.preheader ], [ %indvars.iv.next19, %.preheader3 ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1857, i64 %indvars.iv2258
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader
  %indvars.iv1456 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next15.1, %.preheader2 ]
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1456, i64 %indvars.iv2258
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv1857, i64 %indvars.iv1456
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %23, align 8
  %indvars.iv.next15 = or i64 %indvars.iv1456, 1
  %26 = load double, double* %18, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next15, i64 %indvars.iv2258
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv1857, i64 %indvars.iv.next15
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv1456, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next15.1, 2000
  br i1 %exitcond17.1, label %.preheader3, label %.preheader2

.preheader3:                                      ; preds = %.preheader2
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1857, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond21, label %.preheader4, label %.preheader2.preheader

.preheader4:                                      ; preds = %.preheader3
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2258, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond48, label %.preheader.preheader.preheader, label %.preheader3.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader4
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader1
  %indvars.iv1255 = phi i64 [ %indvars.iv.next13, %.preheader1 ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv54 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.4, %.preheader ]
  %33 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv1255, i64 %indvars.iv54
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1255, i64 %indvars.iv54
  %37 = bitcast double* %36 to i64*
  store i64 %35, i64* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv54, 1
  %38 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv1255, i64 %indvars.iv.next
  %39 = bitcast double* %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1255, i64 %indvars.iv.next
  %42 = bitcast double* %41 to i64*
  store i64 %40, i64* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv54, 2
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv1255, i64 %indvars.iv.next.1
  %44 = bitcast double* %43 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1255, i64 %indvars.iv.next.1
  %47 = bitcast double* %46 to i64*
  store i64 %45, i64* %47, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv54, 3
  %48 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv1255, i64 %indvars.iv.next.2
  %49 = bitcast double* %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1255, i64 %indvars.iv.next.2
  %52 = bitcast double* %51 to i64*
  store i64 %50, i64* %52, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv54, 4
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv1255, i64 %indvars.iv.next.3
  %54 = bitcast double* %53 to i64*
  %55 = load i64, i64* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1255, i64 %indvars.iv.next.3
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv54, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %.preheader1, label %.preheader

.preheader1:                                      ; preds = %.preheader
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1255, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond47, label %58, label %.preheader.preheader

; <label>:58:                                     ; preds = %.preheader1
  tail call void @free(i8* nonnull %16) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #2 {
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3.preheader.backedge, %2
  %indvars.iv2235 = phi i64 [ 0, %2 ], [ %indvars.iv2235.be, %.preheader3.preheader.backedge ]
  %exitcond1127 = icmp eq i64 %indvars.iv2235, 0
  br i1 %exitcond1127, label %.preheader3.preheader.backedge, label %.preheader1.preheader.preheader

.preheader3.preheader.backedge:                   ; preds = %.preheader3.preheader, %.preheader.preheader.lr.ph, %.preheader2._crit_edge
  %indvars.iv2235.be = phi i64 [ %indvars.iv.next23, %.preheader2._crit_edge ], [ 1, %.preheader.preheader.lr.ph ], [ 1, %.preheader3.preheader ]
  br label %.preheader3.preheader

.preheader1.preheader.preheader:                  ; preds = %.preheader3.preheader
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2235, i64 0
  br label %.preheader1.preheader

.preheader.preheader.lr.ph:                       ; preds = %.preheader3
  %exitcond1629 = icmp eq i64 %indvars.iv2235, 0
  br i1 %exitcond1629, label %.preheader3.preheader.backedge, label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader.preheader.lr.ph
  %xtraiter39 = and i64 %indvars.iv2235, 1
  %lcmp.mod40 = icmp eq i64 %xtraiter39, 0
  %4 = icmp eq i64 %indvars.iv2235, 1
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2235, i64 0
  br label %.preheader.preheader

.preheader1.preheader:                            ; preds = %.preheader1.preheader.preheader, %.preheader3
  %indvars.iv628 = phi i64 [ %indvars.iv.next7, %.preheader3 ], [ 0, %.preheader1.preheader.preheader ]
  %exitcond25 = icmp eq i64 %indvars.iv628, 0
  br i1 %exitcond25, label %.preheader3, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader1.preheader
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2235, i64 %indvars.iv628
  %xtraiter = and i64 %indvars.iv628, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader1.prol.loopexit, label %.preheader1.prol

.preheader1.prol:                                 ; preds = %.lr.ph
  %7 = load double, double* %3, align 8
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv628
  %9 = load double, double* %8, align 8
  %10 = fmul double %7, %9
  %11 = load double, double* %6, align 8
  %12 = fsub double %11, %10
  store double %12, double* %6, align 8
  br label %.preheader1.prol.loopexit

.preheader1.prol.loopexit:                        ; preds = %.preheader1.prol, %.lr.ph
  %indvars.iv26.unr.ph = phi i64 [ 1, %.preheader1.prol ], [ 0, %.lr.ph ]
  %13 = icmp eq i64 %indvars.iv628, 1
  br i1 %13, label %.preheader3, label %.preheader1.preheader49

.preheader1.preheader49:                          ; preds = %.preheader1.prol.loopexit
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.preheader49, %.preheader1
  %indvars.iv26 = phi i64 [ %indvars.iv.next.1, %.preheader1 ], [ %indvars.iv26.unr.ph, %.preheader1.preheader49 ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2235, i64 %indvars.iv26
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv628
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = load double, double* %6, align 8
  %20 = fsub double %19, %18
  store double %20, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv26, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2235, i64 %indvars.iv.next
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv628
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = load double, double* %6, align 8
  %27 = fsub double %26, %25
  store double %27, double* %6, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv26, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv628
  br i1 %exitcond.1, label %.preheader3.loopexit, label %.preheader1

.preheader3.loopexit:                             ; preds = %.preheader1
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %.preheader1.prol.loopexit, %.preheader1.preheader
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv628, i64 %indvars.iv628
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2235, i64 %indvars.iv628
  %31 = load double, double* %30, align 8
  %32 = fdiv double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv628, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next7, %indvars.iv2235
  br i1 %exitcond11, label %.preheader.preheader.lr.ph, label %.preheader1.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader2
  %indvars.iv1933 = phi i64 [ %indvars.iv.next20, %.preheader2 ], [ %indvars.iv2235, %.preheader.preheader.preheader ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2235, i64 %indvars.iv1933
  br i1 %lcmp.mod40, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  %34 = load double, double* %5, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv1933
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = load double, double* %33, align 8
  %39 = fsub double %38, %37
  store double %39, double* %33, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv1230.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 %4, label %.preheader2, label %.preheader.preheader48

.preheader.preheader48:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader48, %.preheader
  %indvars.iv1230 = phi i64 [ %indvars.iv.next13.1, %.preheader ], [ %indvars.iv1230.unr.ph, %.preheader.preheader48 ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2235, i64 %indvars.iv1230
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1230, i64 %indvars.iv1933
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = load double, double* %33, align 8
  %46 = fsub double %45, %44
  store double %46, double* %33, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1230, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2235, i64 %indvars.iv.next13
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next13, i64 %indvars.iv1933
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %33, align 8
  %53 = fsub double %52, %51
  store double %53, double* %33, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1230, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next13.1, %indvars.iv2235
  br i1 %exitcond16.1, label %.preheader2.loopexit, label %.preheader

.preheader2.loopexit:                             ; preds = %.preheader
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1933, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond21, label %.preheader2._crit_edge, label %.preheader.preheader

.preheader2._crit_edge:                           ; preds = %.preheader2
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2235, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond24, label %54, label %.preheader3.preheader.backedge

; <label>:54:                                     ; preds = %.preheader2._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %2, %19
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv15, 2000
  br label %8

; <label>:8:                                      ; preds = %.preheader.preheader, %.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %9 = add nuw nsw i64 %indvars.iv4, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.preheader

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %.preheader

.preheader:                                       ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv4
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %.preheader
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %20, label %.preheader.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
