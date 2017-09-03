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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
._crit_edge.lr.ph:
  br label %.lr.ph30

.lr.ph30:                                         ; preds = %._crit_edge.lr.ph, %._crit_edge32
  %indvars.iv81 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next82, %._crit_edge32 ]
  %indvars.iv79 = phi i64 [ 1, %._crit_edge.lr.ph ], [ %indvars.iv.next80, %._crit_edge32 ]
  %2 = mul nuw nsw i64 %indvars.iv81, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep100 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %scevgep100101 = bitcast double* %scevgep100 to i8*
  %4 = sub i64 1998, %indvars.iv81
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  %7 = add nuw nsw i64 %6, 8
  br label %9

._crit_edge8:                                     ; preds = %9
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %8 = icmp slt i64 %indvars.iv.next82, 2000
  br i1 %8, label %._crit_edge32.loopexit, label %._crit_edge32

; <label>:9:                                      ; preds = %9, %.lr.ph30
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %9 ], [ 0, %.lr.ph30 ]
  %10 = sub nsw i64 0, %indvars.iv67
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 %indvars.iv67
  store double %15, double* %16, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next68, %indvars.iv79
  br i1 %exitcond72, label %._crit_edge8, label %9

._crit_edge32.loopexit:                           ; preds = %._crit_edge8
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep100101, i8 0, i64 %7, i32 8, i1 false)
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %._crit_edge8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 %indvars.iv81
  store double 1.000000e+00, double* %17, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next82, 2000
  br i1 %exitcond103, label %._crit_edge34, label %.lr.ph30

._crit_edge34:                                    ; preds = %._crit_edge32
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %._crit_edge27.us.3

._crit_edge13.us.us.preheader:                    ; preds = %._crit_edge13.us.us.preheader.preheader, %._crit_edge23.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge23.us ], [ 0, %._crit_edge13.us.us.preheader.preheader ]
  br label %._crit_edge13.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge21.us.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond93, label %._crit_edge14.us.preheader, label %._crit_edge13.us.us.preheader

._crit_edge14.us.preheader:                       ; preds = %._crit_edge23.us
  br label %._crit_edge14.us

._crit_edge13.us.us:                              ; preds = %._crit_edge21.us.us, %._crit_edge13.us.us.preheader
  %indvars.iv51 = phi i64 [ 0, %._crit_edge13.us.us.preheader ], [ %indvars.iv.next52, %._crit_edge21.us.us ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv55
  br label %._crit_edge13.us.us.new

._crit_edge21.us.us:                              ; preds = %._crit_edge13.us.us.new
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond91, label %._crit_edge23.us, label %._crit_edge13.us.us

._crit_edge13.us.us.new:                          ; preds = %._crit_edge13.us.us, %._crit_edge13.us.us.new
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %._crit_edge13.us.us.new ], [ 0, %._crit_edge13.us.us ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv55
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv51, i64 %indvars.iv47
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next48 = or i64 %indvars.iv47, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next48, i64 %indvars.iv55
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv51, i64 %indvars.iv.next48
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond89.1 = icmp eq i64 %indvars.iv.next48.1, 2000
  br i1 %exitcond89.1, label %._crit_edge21.us.us, label %._crit_edge13.us.us.new

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.preheader, %._crit_edge16.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge16.us ], [ 0, %._crit_edge14.us.preheader ]
  br label %._crit_edge14.us.new

._crit_edge14.us.new:                             ; preds = %._crit_edge14.us, %._crit_edge14.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge14.us.new ], [ 0, %._crit_edge14.us ]
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv43, i64 %indvars.iv
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond86.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond86.3, label %._crit_edge16.us, label %._crit_edge14.us.new

._crit_edge16.us:                                 ; preds = %._crit_edge14.us.new
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond, label %._crit_edge18, label %._crit_edge14.us

._crit_edge18:                                    ; preds = %._crit_edge16.us
  tail call void @free(i8* %18) #3
  ret void

._crit_edge27.us.3:                               ; preds = %._crit_edge27.us.3, %._crit_edge34
  %indvars.iv63 = phi i64 [ 0, %._crit_edge34 ], [ %indvars.iv.next64.3.1, %._crit_edge27.us.3 ]
  %55 = mul nuw nsw i64 %indvars.iv63, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %56 = mul nuw nsw i64 %indvars.iv63, 16000
  %57 = add nuw nsw i64 %56, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %58 = mul nuw nsw i64 %indvars.iv63, 16000
  %59 = add nuw nsw i64 %58, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %60 = mul nuw nsw i64 %indvars.iv63, 16000
  %61 = add nuw nsw i64 %60, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next64.3 = or i64 %indvars.iv63, 4
  %62 = mul nuw nsw i64 %indvars.iv.next64.3, 16000
  %scevgep.1114 = getelementptr i8, i8* %18, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1114, i8 0, i64 16000, i32 8, i1 false)
  %63 = mul nuw nsw i64 %indvars.iv.next64.3, 16000
  %64 = add nuw nsw i64 %63, 16000
  %scevgep.1.1 = getelementptr i8, i8* %18, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %65 = mul nuw nsw i64 %indvars.iv.next64.3, 16000
  %66 = add nuw nsw i64 %65, 32000
  %scevgep.2.1 = getelementptr i8, i8* %18, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %67 = mul nuw nsw i64 %indvars.iv.next64.3, 16000
  %68 = add nuw nsw i64 %67, 48000
  %scevgep.3.1 = getelementptr i8, i8* %18, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next64.3.1 = add nsw i64 %indvars.iv63, 8
  %exitcond97.3.1 = icmp eq i64 %indvars.iv.next64.3.1, 2000
  br i1 %exitcond97.3.1, label %._crit_edge13.us.us.preheader.preheader, label %._crit_edge27.us.3

._crit_edge13.us.us.preheader.preheader:          ; preds = %._crit_edge27.us.3
  br label %._crit_edge13.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
._crit_edge.preheader:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge10
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge10 ], [ 0, %._crit_edge.preheader ]
  %2 = add i64 %indvars.iv26, -2
  %3 = icmp sgt i64 %indvars.iv26, 0
  br i1 %3, label %._crit_edge3.preheader, label %._crit_edge10

._crit_edge3.preheader:                           ; preds = %._crit_edge
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 0
  br label %._crit_edge3

._crit_edge4:                                     ; preds = %._crit_edge6
  %5 = icmp sgt i64 %indvars.iv26, 0
  br i1 %5, label %.lr.ph9, label %._crit_edge10

.lr.ph9:                                          ; preds = %._crit_edge4
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv26
  %xtraiter33 = and i64 %indvars.iv26, 1
  %lcmp.mod34 = icmp eq i64 %xtraiter33, 0
  br i1 %lcmp.mod34, label %.prol.loopexit32, label %.prol.preheader31

.prol.preheader31:                                ; preds = %.lr.ph9
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 0
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = load double, double* %6, align 8
  %11 = fsub double %10, %9
  store double %11, double* %6, align 8
  br label %.prol.loopexit32

.prol.loopexit32:                                 ; preds = %.prol.preheader31, %.lr.ph9
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader31 ], [ 0, %.lr.ph9 ]
  %12 = icmp eq i64 %indvars.iv26, 1
  br i1 %12, label %._crit_edge10, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit32
  %13 = sub i64 %2, %indvars.iv21.unr.ph
  %14 = lshr i64 %13, 1
  %15 = and i64 %14, 1
  %lcmp.mod36 = icmp eq i64 %15, 0
  br i1 %lcmp.mod36, label %.lr.ph9.new.prol.preheader, label %.lr.ph9.new.prol.loopexit.unr-lcssa

.lr.ph9.new.prol.preheader:                       ; preds = %.lr.ph9.new.preheader
  br label %.lr.ph9.new.prol

.lr.ph9.new.prol:                                 ; preds = %.lr.ph9.new.prol.preheader
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv21.unr.ph
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %17
  %19 = load double, double* %6, align 8
  %20 = fsub double %19, %18
  store double %20, double* %6, align 8
  %indvars.iv.next22.prol = add nuw nsw i64 %indvars.iv21.unr.ph, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next22.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %22
  %24 = fsub double %20, %23
  store double %24, double* %6, align 8
  %indvars.iv.next22.1.prol = or i64 %indvars.iv21.unr.ph, 2
  br label %.lr.ph9.new.prol.loopexit.unr-lcssa

.lr.ph9.new.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph9.new.preheader, %.lr.ph9.new.prol
  %indvars.iv21.unr.ph37 = phi i64 [ %indvars.iv.next22.1.prol, %.lr.ph9.new.prol ], [ %indvars.iv21.unr.ph, %.lr.ph9.new.preheader ]
  br label %.lr.ph9.new.prol.loopexit

.lr.ph9.new.prol.loopexit:                        ; preds = %.lr.ph9.new.prol.loopexit.unr-lcssa
  %25 = icmp eq i64 %14, 0
  br i1 %25, label %._crit_edge10.loopexit, label %.lr.ph9.new.preheader.new

.lr.ph9.new.preheader.new:                        ; preds = %.lr.ph9.new.prol.loopexit
  br label %.lr.ph9.new

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge6
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge6 ], [ 0, %._crit_edge3.preheader ]
  %26 = icmp sgt i64 %indvars.iv15, 0
  br i1 %26, label %.lr.ph, label %._crit_edge6

.lr.ph:                                           ; preds = %._crit_edge3
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv15
  %xtraiter = and i64 %indvars.iv15, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %28 = load double, double* %4, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 0
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = load double, double* %27, align 8
  %33 = fsub double %32, %31
  store double %33, double* %27, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %34 = icmp eq i64 %indvars.iv15, 1
  br i1 %34, label %._crit_edge6, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %27, align 8
  %41 = fsub double %40, %39
  store double %41, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %27, align 8
  %48 = fsub double %47, %46
  store double %48, double* %27, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv15
  br i1 %exitcond.1, label %._crit_edge6.loopexit, label %.lr.ph.new

._crit_edge6.loopexit:                            ; preds = %.lr.ph.new
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.prol.loopexit, %._crit_edge3
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv15
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv15
  %52 = load double, double* %51, align 8
  %53 = fdiv double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next16, %indvars.iv26
  br i1 %exitcond20, label %._crit_edge4, label %._crit_edge3

.lr.ph9.new:                                      ; preds = %.lr.ph9.new, %.lr.ph9.new.preheader.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph37, %.lr.ph9.new.preheader.new ], [ %indvars.iv.next22.1.1, %.lr.ph9.new ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv21
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = load double, double* %6, align 8
  %58 = fsub double %57, %56
  store double %58, double* %6, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next22
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %60
  %62 = fsub double %58, %61
  store double %62, double* %6, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next22.1
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %64
  %66 = fsub double %62, %65
  store double %66, double* %6, align 8
  %indvars.iv.next22.138 = add nsw i64 %indvars.iv21, 3
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv.next22.138
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %68
  %70 = fsub double %66, %69
  store double %70, double* %6, align 8
  %indvars.iv.next22.1.1 = add nsw i64 %indvars.iv21, 4
  %exitcond25.1.1 = icmp eq i64 %indvars.iv.next22.1.1, %indvars.iv26
  br i1 %exitcond25.1.1, label %._crit_edge10.loopexit.unr-lcssa, label %.lr.ph9.new

._crit_edge10.loopexit.unr-lcssa:                 ; preds = %.lr.ph9.new
  br label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %.lr.ph9.new.prol.loopexit, %._crit_edge10.loopexit.unr-lcssa
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge, %.prol.loopexit32, %._crit_edge4
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv26
  %72 = load double, double* %71, align 8
  %73 = tail call double @sqrt(double %72) #3
  store double %73, double* %71, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next27, 2000
  br i1 %exitcond30, label %._crit_edge12, label %._crit_edge

._crit_edge12:                                    ; preds = %._crit_edge10
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge.preheader, %._crit_edge4
  %indvars.iv11 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next12, %._crit_edge4 ]
  %indvars.iv9 = phi i64 [ 1, %._crit_edge.preheader ], [ %indvars.iv.next10, %._crit_edge4 ]
  %6 = mul nsw i64 %indvars.iv11, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %.lr.ph ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv9
  br i1 %exitcond, label %._crit_edge4, label %7

._crit_edge4:                                     ; preds = %._crit_edge2
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond15, label %._crit_edge6, label %.lr.ph

._crit_edge6:                                     ; preds = %._crit_edge4
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
