; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader14.lr.ph:
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge40..lr.ph36_crit_edge, %.preheader14.lr.ph
  %indvars.iv91 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next92, %._crit_edge40..lr.ph36_crit_edge ]
  %indvars.iv89 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next90, %._crit_edge40..lr.ph36_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv91, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep87 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %4 = sub i64 1998, %indvars.iv91
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  %7 = add nuw nsw i64 %6, 8
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %8 = icmp slt i64 %indvars.iv.next92, 2000
  br i1 %8, label %._crit_edge40.loopexit, label %._crit_edge40

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv75 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next76, %._crit_edge ]
  %9 = sub nsw i64 0, %indvars.iv75
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv75
  store double %14, double* %15, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next76, %indvars.iv89
  br i1 %exitcond80, label %.preheader13, label %._crit_edge

._crit_edge40.loopexit:                           ; preds = %.preheader13
  %16 = bitcast double* %scevgep87 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %16, i8 0, i64 %7, i32 8, i1 false)
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %.preheader13, %._crit_edge40.loopexit
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv91
  store double 1.000000e+00, double* %17, align 8
  %exitcond94 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond94, label %._crit_edge42, label %._crit_edge40..lr.ph36_crit_edge

._crit_edge40..lr.ph36_crit_edge:                 ; preds = %._crit_edge40
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  br label %.lr.ph36

._crit_edge42:                                    ; preds = %._crit_edge40
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge33.us.3

.preheader10.lr.ph:                               ; preds = %._crit_edge33.us.3
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %._crit_edge22.us, %.preheader10.lr.ph
  %indvars.iv60 = phi i64 [ 0, %.preheader10.lr.ph ], [ %indvars.iv.next61, %._crit_edge22.us ]
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, 2000
  br i1 %exitcond63, label %.preheader.us.preheader, label %.preheader9.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv56 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next57, %._crit_edge20.us.us ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv60
  br label %.preheader9.us.us.new

._crit_edge20.us.us:                              ; preds = %.preheader9.us.us.new
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, 2000
  br i1 %exitcond59, label %._crit_edge22.us, label %.preheader9.us.us

.preheader9.us.us.new:                            ; preds = %.preheader9.us.us.new, %.preheader9.us.us
  %indvars.iv48 = phi i64 [ 0, %.preheader9.us.us ], [ %indvars.iv.next49.1, %.preheader9.us.us.new ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv60
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv56, i64 %indvars.iv48
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next49, i64 %indvars.iv60
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv56, i64 %indvars.iv.next49
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, 2000
  br i1 %exitcond51.1, label %._crit_edge20.us.us, label %.preheader9.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.3, %.preheader.us.new ]
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond, label %._crit_edge17, label %.preheader.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %18) #3
  ret void

._crit_edge33.us.3:                               ; preds = %._crit_edge33.us.3, %._crit_edge42
  %indvars.iv68 = phi i64 [ 0, %._crit_edge42 ], [ %indvars.iv.next69.3.1, %._crit_edge33.us.3 ]
  %55 = mul nuw nsw i64 %indvars.iv68, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %56 = mul nuw nsw i64 %indvars.iv68, 16000
  %57 = add nuw nsw i64 %56, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %58 = mul nuw nsw i64 %indvars.iv68, 16000
  %59 = add nuw nsw i64 %58, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %60 = mul nuw nsw i64 %indvars.iv68, 16000
  %61 = add nuw nsw i64 %60, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next69.3 = or i64 %indvars.iv68, 4
  %62 = mul nuw nsw i64 %indvars.iv.next69.3, 16000
  %scevgep.199 = getelementptr i8, i8* %18, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.199, i8 0, i64 16000, i32 8, i1 false)
  %63 = mul nuw nsw i64 %indvars.iv.next69.3, 16000
  %64 = add nuw nsw i64 %63, 16000
  %scevgep.1.1 = getelementptr i8, i8* %18, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %65 = mul nuw nsw i64 %indvars.iv.next69.3, 16000
  %66 = add nuw nsw i64 %65, 32000
  %scevgep.2.1 = getelementptr i8, i8* %18, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %67 = mul nuw nsw i64 %indvars.iv.next69.3, 16000
  %68 = add nuw nsw i64 %67, 48000
  %scevgep.3.1 = getelementptr i8, i8* %18, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next69.3.1 = add nsw i64 %indvars.iv68, 8
  %exitcond71.3.1 = icmp eq i64 %indvars.iv.next69.3.1, 2000
  br i1 %exitcond71.3.1, label %.preheader10.lr.ph, label %._crit_edge33.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader4.preheader:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %.preheader4.preheader
  %indvars.iv32 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next33, %._crit_edge9 ]
  %2 = add i64 %indvars.iv32, -2
  %3 = add i64 %indvars.iv32, 4294967295
  %4 = icmp sgt i64 %indvars.iv32, 0
  br i1 %4, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 0
  br label %.preheader

.preheader3:                                      ; preds = %._crit_edge
  %6 = icmp sgt i64 %indvars.iv32, 0
  br i1 %6, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %.preheader3
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv32
  %xtraiter2836 = and i64 %indvars.iv32, 1
  %lcmp.mod29 = icmp eq i64 %xtraiter2836, 0
  br i1 %lcmp.mod29, label %.prol.loopexit27, label %.prol.preheader26

.prol.preheader26:                                ; preds = %.lr.ph8
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 0
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = load double, double* %7, align 8
  %12 = fsub double %11, %10
  store double %12, double* %7, align 8
  br label %.prol.loopexit27

.prol.loopexit27:                                 ; preds = %.lr.ph8, %.prol.preheader26
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader26 ], [ 0, %.lr.ph8 ]
  %13 = trunc i64 %3 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %._crit_edge9, label %.lr.ph8.new.preheader

.lr.ph8.new.preheader:                            ; preds = %.prol.loopexit27
  %15 = sub i64 %2, %indvars.iv21.unr.ph
  %16 = lshr i64 %15, 1
  %17 = and i64 %16, 1
  %lcmp.mod38 = icmp eq i64 %17, 0
  br i1 %lcmp.mod38, label %.lr.ph8.new.prol.preheader, label %.lr.ph8.new.prol.loopexit.unr-lcssa

.lr.ph8.new.prol.preheader:                       ; preds = %.lr.ph8.new.preheader
  br label %.lr.ph8.new.prol

.lr.ph8.new.prol:                                 ; preds = %.lr.ph8.new.prol.preheader
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv21.unr.ph
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = load double, double* %7, align 8
  %22 = fsub double %21, %20
  store double %22, double* %7, align 8
  %indvars.iv.next22.prol = add nuw nsw i64 %indvars.iv21.unr.ph, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22.prol
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %24
  %26 = fsub double %22, %25
  store double %26, double* %7, align 8
  %indvars.iv.next22.1.prol = or i64 %indvars.iv21.unr.ph, 2
  br label %.lr.ph8.new.prol.loopexit.unr-lcssa

.lr.ph8.new.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph8.new.preheader, %.lr.ph8.new.prol
  %indvars.iv21.unr.ph39 = phi i64 [ %indvars.iv.next22.1.prol, %.lr.ph8.new.prol ], [ %indvars.iv21.unr.ph, %.lr.ph8.new.preheader ]
  br label %.lr.ph8.new.prol.loopexit

.lr.ph8.new.prol.loopexit:                        ; preds = %.lr.ph8.new.prol.loopexit.unr-lcssa
  %27 = icmp eq i64 %16, 0
  br i1 %27, label %._crit_edge9.loopexit, label %.lr.ph8.new.preheader.new

.lr.ph8.new.preheader.new:                        ; preds = %.lr.ph8.new.prol.loopexit
  br label %.lr.ph8.new

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next17, %._crit_edge ]
  %28 = add i64 %indvars.iv16, 4294967295
  %29 = icmp sgt i64 %indvars.iv16, 0
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv16
  %xtraiter37 = and i64 %indvars.iv16, 1
  %lcmp.mod = icmp eq i64 %xtraiter37, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %31 = load double, double* %5, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 0
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = load double, double* %30, align 8
  %36 = fsub double %35, %34
  store double %36, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %37 = trunc i64 %28 to i32
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = load double, double* %30, align 8
  %45 = fsub double %44, %43
  store double %45, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %30, align 8
  %52 = fsub double %51, %50
  store double %52, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv16
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv16
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv16
  %56 = load double, double* %55, align 8
  %57 = fdiv double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %indvars.iv32
  br i1 %exitcond, label %.preheader3, label %.preheader

.lr.ph8.new:                                      ; preds = %.lr.ph8.new, %.lr.ph8.new.preheader.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph39, %.lr.ph8.new.preheader.new ], [ %indvars.iv.next22.1.1, %.lr.ph8.new ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv21
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %59
  %61 = load double, double* %7, align 8
  %62 = fsub double %61, %60
  store double %62, double* %7, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %64
  %66 = fsub double %62, %65
  store double %66, double* %7, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22.1
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %68
  %70 = fsub double %66, %69
  store double %70, double* %7, align 8
  %indvars.iv.next22.140 = add nsw i64 %indvars.iv21, 3
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22.140
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %72
  %74 = fsub double %70, %73
  store double %74, double* %7, align 8
  %indvars.iv.next22.1.1 = add nsw i64 %indvars.iv21, 4
  %exitcond25.1.1 = icmp eq i64 %indvars.iv.next22.1.1, %indvars.iv32
  br i1 %exitcond25.1.1, label %._crit_edge9.loopexit.unr-lcssa, label %.lr.ph8.new

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %.lr.ph8.new
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %.lr.ph8.new.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.prol.loopexit27, %.preheader3, %.preheader4
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv32
  %76 = load double, double* %75, align 8
  %77 = tail call double @sqrt(double %76) #3
  store double %77, double* %75, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 2000
  br i1 %exitcond35, label %._crit_edge11, label %.preheader4

._crit_edge11:                                    ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.preheader.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next8, %._crit_edge..lr.ph_crit_edge ]
  %6 = mul nsw i64 %indvars.iv9, 2000
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge13 ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge13

; <label>:11:                                     ; preds = %._crit_edge14
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond, label %._crit_edge, label %._crit_edge14

._crit_edge:                                      ; preds = %._crit_edge13
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond12, label %._crit_edge4, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  br label %.lr.ph

._crit_edge4:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
