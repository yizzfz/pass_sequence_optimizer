; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader13.lr.ph:
  br label %.lr.ph35.preheader

.lr.ph35.preheader:                               ; preds = %.preheader13.lr.ph, %._crit_edge40..preheader13_crit_edge
  %indvars.iv92 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next93, %._crit_edge40..preheader13_crit_edge ]
  %indvars.iv90 = phi i64 [ 1, %.preheader13.lr.ph ], [ %indvars.iv.next91, %._crit_edge40..preheader13_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv92, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep88 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %scevgep8889 = bitcast double* %scevgep88 to i8*
  %4 = sub i64 1998, %indvars.iv92
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  %7 = add nuw nsw i64 %6, 8
  br label %.lr.ph35

.lr.ph35:                                         ; preds = %.lr.ph35, %.lr.ph35.preheader
  %indvars.iv76 = phi i64 [ 0, %.lr.ph35.preheader ], [ %indvars.iv.next77, %.lr.ph35 ]
  %8 = sub nsw i64 0, %indvars.iv76
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv76
  store double %13, double* %14, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next77, %indvars.iv90
  br i1 %exitcond81, label %.preheader13._crit_edge, label %.lr.ph35

.preheader13._crit_edge:                          ; preds = %.lr.ph35
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %15 = icmp slt i64 %indvars.iv.next93, 2000
  br i1 %15, label %._crit_edge40..preheader13_crit_edge, label %._crit_edge42

._crit_edge40..preheader13_crit_edge:             ; preds = %.preheader13._crit_edge
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8889, i8 0, i64 %7, i32 8, i1 false)
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv92
  store double 1.000000e+00, double* %16, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  br label %.lr.ph35.preheader

._crit_edge42:                                    ; preds = %.preheader13._crit_edge
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv92, i64 %indvars.iv92
  store double 1.000000e+00, double* %17, align 8
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %._crit_edge32.us.3

.preheader10.us:                                  ; preds = %.preheader10.us.preheader, %._crit_edge21.us-lcssa.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge21.us-lcssa.us.us ], [ 0, %.preheader10.us.preheader ]
  br label %.preheader9.us.us

.preheader9.us.us:                                ; preds = %._crit_edge19.us.us, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge19.us.us ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv61
  br label %.preheader9.us.us.new

._crit_edge19.us.us:                              ; preds = %.preheader9.us.us.new
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond60, label %._crit_edge21.us-lcssa.us.us, label %.preheader9.us.us

.preheader9.us.us.new:                            ; preds = %.preheader9.us.us, %.preheader9.us.us.new
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.preheader9.us.us.new ], [ 0, %.preheader9.us.us ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv61
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv57, i64 %indvars.iv49
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next50, i64 %indvars.iv61
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv57, i64 %indvars.iv.next50
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond52.1, label %._crit_edge19.us.us, label %.preheader9.us.us.new

._crit_edge21.us-lcssa.us.us:                     ; preds = %._crit_edge19.us.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 2000
  br i1 %exitcond64, label %.preheader.us.preheader, label %.preheader10.us

.preheader.us.preheader:                          ; preds = %._crit_edge21.us-lcssa.us.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ 0, %.preheader.us ]
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv46, i64 %indvars.iv
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond, label %._crit_edge16, label %.preheader.us

._crit_edge16:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %18) #4
  ret void

._crit_edge32.us.3:                               ; preds = %._crit_edge32.us.3, %._crit_edge42
  %indvars.iv69 = phi i64 [ 0, %._crit_edge42 ], [ %indvars.iv.next70.3.1, %._crit_edge32.us.3 ]
  %55 = mul nuw nsw i64 %indvars.iv69, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %56 = add nuw nsw i64 %55, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %57 = add nuw nsw i64 %55, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %58 = add nuw nsw i64 %55, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next70.3 = or i64 %indvars.iv69, 4
  %59 = mul nuw nsw i64 %indvars.iv.next70.3, 16000
  %scevgep.1109 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1109, i8 0, i64 16000, i32 8, i1 false)
  %60 = add nuw nsw i64 %59, 16000
  %scevgep.1.1 = getelementptr i8, i8* %18, i64 %60
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %61 = add nuw nsw i64 %59, 32000
  %scevgep.2.1 = getelementptr i8, i8* %18, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %62 = add nuw nsw i64 %59, 48000
  %scevgep.3.1 = getelementptr i8, i8* %18, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next70.3.1 = add nsw i64 %indvars.iv69, 8
  %exitcond72.3.1 = icmp eq i64 %indvars.iv.next70.3.1, 2000
  br i1 %exitcond72.3.1, label %.preheader10.us.preheader, label %._crit_edge32.us.3

.preheader10.us.preheader:                        ; preds = %._crit_edge32.us.3
  br label %.preheader10.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
.preheader6.preheader:
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.preheader, %._crit_edge13
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge13 ], [ 0, %.preheader6.preheader ]
  %2 = add i64 %indvars.iv49, 4294967295
  %3 = icmp sgt i64 %indvars.iv49, 0
  br i1 %3, label %.preheader4.preheader, label %._crit_edge13

.preheader4.preheader:                            ; preds = %.preheader6
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 0
  br label %.preheader4

.preheader.lr.ph:                                 ; preds = %.preheader4._crit_edge
  br i1 true, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge13_crit_edge

.preheader.lr.ph.._crit_edge13_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge13

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter3853 = and i64 %indvars.iv49, 1
  %lcmp.mod39 = icmp eq i64 %xtraiter3853, 0
  %5 = trunc i64 %2 to i32
  %6 = icmp eq i32 %5, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge11.us ], [ %indvars.iv49, %.preheader.us.preheader ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv43
  %.pre20 = load double, double* %7, align 8
  br i1 %lcmp.mod39, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %8 = load double, double* %4, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv43
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = fsub double %.pre20, %11
  store double %12, double* %7, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv33.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  %.unr40.ph = phi double [ %12, %.prol.preheader ], [ %.pre20, %.preheader.us ]
  br i1 %6, label %._crit_edge11.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %.preheader.us.new ], [ %indvars.iv33.unr.ph, %.preheader.us.new.preheader ]
  %13 = phi double [ %25, %.preheader.us.new ], [ %.unr40.ph, %.preheader.us.new.preheader ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv33
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv43
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %13, %18
  store double %19, double* %7, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv.next34
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next34, i64 %indvars.iv43
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %7, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next34.1, %indvars.iv49
  br i1 %exitcond37.1, label %._crit_edge11.us.loopexit, label %.preheader.us.new

._crit_edge11.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.prol.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond46, label %._crit_edge13.loopexit, label %.preheader.us

.preheader4:                                      ; preds = %.preheader4.preheader, %.preheader4._crit_edge
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %.preheader4._crit_edge ], [ 0, %.preheader4.preheader ]
  %26 = add i64 %indvars.iv27, 4294967295
  %27 = icmp sgt i64 %indvars.iv27, 0
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv27
  %.pre = load double, double* %28, align 8
  br i1 %27, label %.lr.ph.preheader, label %.preheader4._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader4
  %xtraiter54 = and i64 %indvars.iv27, 1
  %lcmp.mod = icmp eq i64 %xtraiter54, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %29 = load double, double* %4, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv27
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %.pre, %32
  store double %33, double* %28, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %33, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %.lcssa.unr.ph = phi double [ %33, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %34 = trunc i64 %26 to i32
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %.preheader4._crit_edge, label %.lr.ph.preheader57

.lr.ph.preheader57:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader57, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph ], [ %indvars.iv.unr.ph, %.lr.ph.preheader57 ]
  %36 = phi double [ %48, %.lr.ph ], [ %.unr.ph, %.lr.ph.preheader57 ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv27
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %36, %41
  store double %42, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv27
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %28, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv27
  br i1 %exitcond.1, label %.preheader4._crit_edge.loopexit, label %.lr.ph

.preheader4._crit_edge.loopexit:                  ; preds = %.lr.ph
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader4
  %49 = phi double [ %.pre, %.preheader4 ], [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %48, %.preheader4._crit_edge.loopexit ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv27
  %51 = load double, double* %50, align 8
  %52 = fdiv double %49, %51
  store double %52, double* %28, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %indvars.iv49
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader4

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.preheader.lr.ph.._crit_edge13_crit_edge, %._crit_edge13.loopexit, %.preheader6
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, 2000
  br i1 %exitcond52, label %._crit_edge17, label %.preheader6

._crit_edge17:                                    ; preds = %._crit_edge13
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv5, 2000
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 2000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
