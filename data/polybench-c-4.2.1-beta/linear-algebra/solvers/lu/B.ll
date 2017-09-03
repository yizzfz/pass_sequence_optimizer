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
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  tail call void @free(i8* %18) #4
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.preheader:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge14
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge14 ], [ 0, %._crit_edge.preheader ]
  %2 = icmp sgt i64 %indvars.iv38, 0
  br i1 %2, label %._crit_edge4.preheader, label %._crit_edge14

._crit_edge4.preheader:                           ; preds = %._crit_edge
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 0
  br label %._crit_edge4

._crit_edge6.lr.ph:                               ; preds = %._crit_edge8
  %4 = icmp sgt i64 %indvars.iv38, 0
  br i1 %4, label %._crit_edge6.us.preheader, label %._crit_edge14

._crit_edge6.us.preheader:                        ; preds = %._crit_edge6.lr.ph
  %xtraiter47 = and i64 %indvars.iv38, 1
  %lcmp.mod48 = icmp eq i64 %xtraiter47, 0
  %5 = icmp eq i64 %indvars.iv38, 1
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 0
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.preheader, %._crit_edge12.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge12.us ], [ %indvars.iv38, %._crit_edge6.us.preheader ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv34
  br i1 %lcmp.mod48, label %.prol.loopexit46, label %.prol.preheader45

.prol.preheader45:                                ; preds = %._crit_edge6.us
  %8 = load double, double* %6, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv34
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = load double, double* %7, align 8
  %13 = fsub double %12, %11
  store double %13, double* %7, align 8
  br label %.prol.loopexit46

.prol.loopexit46:                                 ; preds = %.prol.preheader45, %._crit_edge6.us
  %indvars.iv27.unr.ph = phi i64 [ 1, %.prol.preheader45 ], [ 0, %._crit_edge6.us ]
  br i1 %5, label %._crit_edge12.us, label %._crit_edge6.us.new.preheader

._crit_edge6.us.new.preheader:                    ; preds = %.prol.loopexit46
  br label %._crit_edge6.us.new

._crit_edge6.us.new:                              ; preds = %._crit_edge6.us.new.preheader, %._crit_edge6.us.new
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %._crit_edge6.us.new ], [ %indvars.iv27.unr.ph, %._crit_edge6.us.new.preheader ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv27
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv34
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = load double, double* %7, align 8
  %20 = fsub double %19, %18
  store double %20, double* %7, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next28
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next28, i64 %indvars.iv34
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = load double, double* %7, align 8
  %27 = fsub double %26, %25
  store double %27, double* %7, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv38
  br i1 %exitcond31.1, label %._crit_edge12.us.loopexit, label %._crit_edge6.us.new

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge6.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit46
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond42, label %._crit_edge14.loopexit, label %._crit_edge6.us

._crit_edge4:                                     ; preds = %._crit_edge4.preheader, %._crit_edge8
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge8 ], [ 0, %._crit_edge4.preheader ]
  %28 = icmp sgt i64 %indvars.iv20, 0
  br i1 %28, label %.lr.ph, label %._crit_edge8

.lr.ph:                                           ; preds = %._crit_edge4
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv20
  %xtraiter = and i64 %indvars.iv20, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %30 = load double, double* %3, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv20
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %29, align 8
  %35 = fsub double %34, %33
  store double %35, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %36 = icmp eq i64 %indvars.iv20, 1
  br i1 %36, label %._crit_edge8, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv20
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = load double, double* %29, align 8
  %43 = fsub double %42, %41
  store double %43, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv20
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = load double, double* %29, align 8
  %50 = fsub double %49, %48
  store double %50, double* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv20
  br i1 %exitcond.1, label %._crit_edge8.loopexit, label %.lr.ph.new

._crit_edge8.loopexit:                            ; preds = %.lr.ph.new
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.prol.loopexit, %._crit_edge4
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv20
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv20
  %54 = load double, double* %53, align 8
  %55 = fdiv double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next21, %indvars.iv38
  br i1 %exitcond25, label %._crit_edge6.lr.ph, label %._crit_edge4

._crit_edge14.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %._crit_edge, %._crit_edge6.lr.ph
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next39, 2000
  br i1 %exitcond44, label %._crit_edge16, label %._crit_edge

._crit_edge16:                                    ; preds = %._crit_edge14
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next8, %._crit_edge4.us ]
  %6 = mul nsw i64 %indvars.iv7, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2.us ], [ 0, %._crit_edge.us ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond12, label %._crit_edge4.us, label %7

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge.us

._crit_edge6:                                     ; preds = %._crit_edge4.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
